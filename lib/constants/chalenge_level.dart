import '../generated/l10n.dart';

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

  String string(context) {
    switch (this) {
      case ChalengeLevel.beginner:
        return S.of(context).chalenge_level_beginner;
      case ChalengeLevel.normal:
        return S.of(context).chalenge_level_normal;
      case ChalengeLevel.expert:
        return S.of(context).chalenge_level_expert;
    }
  }
}
