import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/level_resource.dart';

import '../../helpers/sharedpref.dart';

class LevelSelectionState {
  final Map<int, int> levels;

  LevelSelectionState({
    required this.levels,
  });

  factory LevelSelectionState.i() {
    return LevelSelectionState(
      levels: {},
    );
  }

  copyWith({
    Map<int, int>? levels,
  }) {
    return LevelSelectionState(
      levels: levels ?? this.levels,
    );
  }
}

class LevelSelectionBloc extends Cubit<LevelSelectionState> {
  LevelSelectionBloc() : super(LevelSelectionState.i());

  final SharedPref _sharedPref = GetIt.I.get<SharedPref>();

  Map<int, int> get levels => state.levels;

  load() {
    emit(state.copyWith(
        levels: LevelResource()
            .levels
            .map((key, value) => MapEntry(key, _sharedPref.getLearningLevelScore(key)))));
  }
}
