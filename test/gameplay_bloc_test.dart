import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/level_resource.dart';
import 'package:project_s/features/gameplay/gameplay_bloc.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/helpers/waste_helper.dart';

import 'test_utils.mocks.dart';

void main() async {
  final MockSharedPref sharedPref = MockSharedPref();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    GetIt.instance.registerSingleton<SharedPref>(sharedPref);
    await WasteHelper.init();
  });
  group('gameplay bloc functions test', () {
    blocTest<GameplayBloc, GameplayState>(
      "add card to queue",
      build: () => GameplayBloc(),
      act: (bloc) async {
        final testLevel = LevelResource().levels.keys.first;
        bloc.level = testLevel;
        await bloc.addCardToQueue();
      },
      expect: () => [isA<GameplayState>(), isA<GameplayState>()],
      verify: (bloc) {
        final GameplayState state = bloc.state;

        expect(state.queue.length, greaterThan(0));
      },
    );

    blocTest<GameplayBloc, GameplayState>(
      "spawn effect change back to normal state",
      build: () => GameplayBloc(),
      act: (bloc) async {
        await bloc.spawnCardEffect();
      },
      expect: () => [isA<GameplayState>()],
      skip: 1,
      verify: (bloc) {
        final GameplayState state = bloc.state;

        expect(state.cardScale, 1);
        expect(state.cardSlide, Offset.zero);
      },
    );

    blocTest<GameplayBloc, GameplayState>(
      "clear queue",
      build: () => GameplayBloc(),
      act: (bloc) async {
        final testLevel = LevelResource().levels.keys.first;
        bloc.level = testLevel;
        await bloc.clearQueue();
      },
      expect: () => [isA<GameplayState>()],
      verify: (bloc) {
        final GameplayState state = bloc.state;

        expect(state.queue.length, 0);
      },
    );
  });
}
