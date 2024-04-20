import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:project_s/constants/level_resource.dart';
import 'package:project_s/features/level_selection/level_selection_bloc.dart';
import 'package:project_s/helpers/sharedpref.dart';

import 'test_utils.mocks.dart';

void main() async {
  final MockSharedPref sharedPref = MockSharedPref();

  setUpAll(() {
    GetIt.instance.registerSingleton<SharedPref>(sharedPref);
  });

  group('level selection bloc functions test', () {
    setUp(() {
      when(sharedPref.getLearningLevelScore(any)).thenReturn(0);
      when(sharedPref.getLearningLevelScore(1)).thenReturn(3);
    });

    blocTest(
      'load levels',
      build: () => LevelSelectionBloc(),
      act: (bloc) => bloc.load(),
      expect: () => [isA<LevelSelectionState>()],
      verify: (bloc) {
        final LevelSelectionState state = bloc.state;

        expect(state.levels.length, LevelResource().levels.length);
        expect(state.levels[1], 3);
        expect(state.levels[2], 0);
      },
    );
  });
}
