import 'package:shared_preferences/shared_preferences.dart';

import '../constants/chalenge_level.dart';

class SharedPref {
  static const learningLevelScoreKey = 'LEARNING_LEVEL_SCORE_KEY';
  static const chalengeHighScoreKey = 'CHALENGE_HIGH_SCORE_KEY';

  final SharedPreferences prefs;

  SharedPref(this.prefs);

  Future<void> writeChalengeHighScore(ChalengeLevel chalengeLevel, int score) async {
    await prefs.setInt('${chalengeHighScoreKey}_${chalengeLevel.name}', score);
  }

  int getChalengeHighScore(ChalengeLevel chalengeLevel) {
    return prefs.getInt('${chalengeHighScoreKey}_${chalengeLevel.name}') ?? 0;
  }

  Future<void> writeLearningLevelScore(int level, int score) async {
    await prefs.setInt('${learningLevelScoreKey}_$level', score);
  }

  int getLearningLevelScore(int? level) {
    return prefs.getInt('${learningLevelScoreKey}_$level') ?? 0;
  }
}
