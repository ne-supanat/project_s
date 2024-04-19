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

  String get string => S.current.chalenge_level(this);
}
