import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const highScoreKey = 'HIGH_SCORE_KEY';

  final SharedPreferences prefs;

  SharedPref(this.prefs);

  Future init() async {}

  Future writeHighScore(int score) async {
    await prefs.setInt(highScoreKey, score);
  }

  int getHighScore() {
    return prefs.getInt(highScoreKey) ?? 0;
  }
}
