import 'package:project_s/helpers/translations.dart';

enum ChalengeLevel { beginner, normal, expert }

extension ChalengeLevelExtension on ChalengeLevel {
  num get time {
    switch (this) {
      case ChalengeLevel.beginner:
        return 15;
      case ChalengeLevel.normal:
        return 7;
      case ChalengeLevel.expert:
        return 3;
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
