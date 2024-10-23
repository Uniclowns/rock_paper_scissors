import 'package:flutter/material.dart';
import '../models/game_result.dart';
import '../services/api_service.dart';

/// Tampilan utama dari permainan Rock Paper Scissors.
class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final ApiService _apiService = ApiService(); // Inisialisasi service API

  String _result = ''; // Menyimpan hasil pertandingan
  String _playerChoice = ''; // Menyimpan pilihan pemain
  String _aiChoice = ''; // Menyimpan pilihan AI

  /// Fungsi yang dipanggil ketika pemain memilih Rock, Paper, atau Scissors.
  ///
  /// Mengambil [playerChoice] sebagai parameter dan memanggil API untuk mendapatkan hasil pertandingan.
  Future<void> _onPlayerMove(String playerChoice) async {
    // Menyimpan pilihan pemain dan menampilkan pesan loading saat menunggu API
    setState(() {
      _playerChoice = playerChoice;
      _result = 'Loading...';
    });

    // Memanggil API untuk mendapatkan hasil permainan
    try {
      GameResult gameResult = await _apiService.getGameResult(playerChoice);

      // Update tampilan setelah hasil dari API diterima
      setState(() {
        _playerChoice = gameResult.userChoice;
        _aiChoice = gameResult.aiChoice;
        _result = gameResult.result;
      });
    } catch (e) {
      setState(() {
        _result =
            'Error: ${e.toString()}'; // Menampilkan error jika terjadi kesalahan saat memanggil API
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan pilihan pengguna dan pilihan AI
            Text(
              'Your Choice: $_playerChoice',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'AI Choice: $_aiChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),

            // Menampilkan hasil pertandingan (Menang, Kalah, Seri)
            Text(
              _result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            // Tombol untuk pemain memilih Rock, Paper, atau Scissors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      _onPlayerMove('rock'), // Pemain memilih "Rock"
                  child: Text('Rock'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      _onPlayerMove('paper'), // Pemain memilih "Paper"
                  child: Text('Paper'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      _onPlayerMove('scissors'), // Pemain memilih "Scissors"
                  child: Text('Scissors'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
