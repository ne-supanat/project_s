import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/features/main_menu/main_menu_bloc.dart';
import 'package:project_s/helpers/bg_audio_helper.dart';

import 'test_utils.mocks.dart';

void main() async {
  final bgAudioHelper = MockBgAudioHelper();

  setUpAll(() {
    GetIt.instance.registerSingleton<BgAudioHelper>(bgAudioHelper);
  });

  group('main menu bloc functions test', () {
    blocTest<MainMenuBloc, MainMenuState>(
      "start",
      build: () => MainMenuBloc(),
      act: (bloc) => bloc.start(),
      expect: () => [isA<MainMenuState>()],
      verify: (bloc) {
        final MainMenuState state = bloc.state;

        expect(state.started, true);
      },
    );
  });
}
