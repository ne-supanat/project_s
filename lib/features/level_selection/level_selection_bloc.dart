import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/level_resource.dart';

import '../../helpers/sharedpref.dart';

class LevelSelectPageState {
  final Map<int, int> levels;

  LevelSelectPageState({
    required this.levels,
  });

  factory LevelSelectPageState.i() {
    return LevelSelectPageState(
      levels: {},
    );
  }

  copyWith({
    Map<int, int>? levels,
  }) {
    return LevelSelectPageState(
      levels: levels ?? this.levels,
    );
  }
}

class LevelSelectPageController extends Cubit<LevelSelectPageState> {
  LevelSelectPageController() : super(LevelSelectPageState.i());

  final SharedPref _sharedPref = GetIt.I.get<SharedPref>();

  Map<int, int> get levels => state.levels;

  load() {
    emit(state.copyWith(
        levels: LevelResource()
            .levels
            .map((key, value) => MapEntry(key, _sharedPref.getLearningLevelScore(key)))));
  }
}
