//only works with command: flutter test test/main_menu_view_web_test.dart --platform chrome
@TestOn('chrome')

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:project_s/features/main_menu/main_menu_view.dart';
import 'package:project_s/helpers/bg_audio_helper.dart';

import 'test_utils.dart';
import 'test_utils.mocks.dart';

void main() {
  final MockBgAudioHelper bgAudioHelper = MockBgAudioHelper();

  setUpAll(() {
    GetIt.instance.registerSingleton<BgAudioHelper>(bgAudioHelper);
  });

  setUp(() {
    when(bgAudioHelper.play()).thenAnswer((realInvocation) => 0);
  });

  testWidgets('main menu view elements test web', (WidgetTester tester) async {
    const mainMenuWidget = MainMenuView();

    await tester.wrapAndPump(mainMenuWidget);

    expect(find.text('- Press Anything to Start -'), findsOneWidget);

    await tester.tap(find.text('- Press Anything to Start -'));
    await tester.pumpAndSettle();

    expect(find.text('Waste Wise'), findsOneWidget);
    expect(find.text('Learning'), findsOneWidget);
    expect(find.text('Challenge'), findsOneWidget);
    expect(find.text('Knowledge'), findsOneWidget);
    expect(find.text('Tutorial'), findsOneWidget);

    verify(bgAudioHelper.play());
  });
}
