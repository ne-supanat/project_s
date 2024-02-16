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
}
