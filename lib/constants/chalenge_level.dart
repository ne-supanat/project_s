import '../resources/translation_keys.dart';

enum ChalengeLevel { beginner, normal, expert }

extension ChalengeLevelExtension on ChalengeLevel {
  num get time {
    switch (this) {
      case ChalengeLevel.beginner:
        return 10;
      case ChalengeLevel.normal:
        return 5;
      case ChalengeLevel.expert:
        return 2;
    }
  }

  String get string {
    switch (this) {
      case ChalengeLevel.beginner:
        return TranslationKeys.chalenge_level_beginner;
      case ChalengeLevel.normal:
        return TranslationKeys.chalenge_level_normal;
      case ChalengeLevel.expert:
        return TranslationKeys.chalenge_level_expert;
    }
  }
}
