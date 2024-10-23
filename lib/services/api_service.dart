import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game_result.dart';

/// Kelas ApiService bertanggung jawab untuk melakukan komunikasi dengan API eksternal.
class ApiService {
  // URL dasar API
  static const String _baseUrl =
      'https://rock-paper-scissors14.p.rapidapi.com/';

  // Header API untuk otentikasi dan host
  static const Map<String, String> _headers = {
    'x-rapidapi-host': 'rock-paper-scissors14.p.rapidapi.com',
    'x-rapidapi-key': '501efe87eemsh18cba7e110f43d6p1d707ejsne0cbf8e0fd41',
  };

  /// Fungsi yang mengambil hasil pertandingan dari API berdasarkan pilihan pengguna.
  ///
  /// [playerChoice] adalah pilihan pemain yang dikirim ke API.
  /// Mengembalikan objek GameResult yang berisi pilihan AI, pilihan pengguna, dan hasil pertandingan.
  Future<GameResult> getGameResult(String playerChoice) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?choice=$playerChoice'),
      headers: _headers,
    );

    // Jika response berhasil (status code 200), decode hasilnya
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return GameResult.fromJson(data);
    } else {
      throw Exception('Failed to load game result');
    }
  }
}
