import 'package:flutter/material.dart';
import '../views/game_page.dart';

/// Main entry point untuk aplikasi Rock Paper Scissors.
void main() {
  runApp(MyApp());
}

/// Kelas MyApp merupakan widget utama yang memuat halaman GamePage.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(), // Memuat tampilan utama permainan
    );
  }
}
