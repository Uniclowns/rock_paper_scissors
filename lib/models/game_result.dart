/// Model untuk menyimpan hasil pertandingan dari API.
class GameResult {
  final String userChoice; // Pilihan yang dibuat oleh pengguna
  final String aiChoice; // Pilihan yang dibuat oleh AI
  final String result; // Hasil dari pertandingan (Menang, Kalah, atau Seri)

  /// Konstruktor dari GameResult
  GameResult({
    required this.userChoice,
    required this.aiChoice,
    required this.result,
  });

  /// Factory method untuk membuat instance GameResult dari JSON
  factory GameResult.fromJson(Map<String, dynamic> json) {
    return GameResult(
      userChoice: json['user']['name'],
      aiChoice: json['ai']['name'],
      result: json['result'],
    );
  }
}
