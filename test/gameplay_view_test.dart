import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/chalenge_level.dart';
import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/features/gameplay/gameplay_view.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/helpers/waste_helper.dart';
import 'package:project_s/widgets/bin_placeholder.dart';
import 'package:project_s/widgets/knowledge_dialog.dart';
import 'package:project_s/widgets/waste_card.dart';

import 'test_utils.dart';
import 'test_utils.mocks.dart';

void main() async {
  SharedPref sharedPref = MockSharedPref();

  setUpAll(() async {
    GetIt.instance.registerSingleton<SharedPref>(sharedPref);
    await WasteHelper.init();
  });

  testWidgets('gameplay view common elements test', (WidgetTester tester) async {
    final gameplayWidget = GameplayView(arguments: GameplayViewArguments(level: 1));

    await tester.wrapAndPump(gameplayWidget);

    expect(find.byIcon(Icons.arrow_back_rounded), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_rounded), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    expect(find.byIcon(Icons.visibility_outlined), findsNothing);

    expect(find.byType(BinPlaceHolder), findsExactly(WasteType.values.length));

    for (final type in WasteType.values) {
      expect(find.text(type.string), findsOneWidget);
    }

    expect(find.byType(WasteCard), findsOneWidget);
  });

  testWidgets('knowledge button test', (WidgetTester tester) async {
    final gameplayWidget = GameplayView(arguments: GameplayViewArguments(level: 1));

    await tester.wrapAndPump(gameplayWidget);

    expect(find.byIcon(Icons.menu_book_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu_book_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(KnowledgeDialog), findsOneWidget);

    await tester.tap(find.byType(CloseButton));
    await tester.pumpAndSettle();

    expect(find.byType(KnowledgeDialog), findsNothing);
  });

  testWidgets('hint button test', (WidgetTester tester) async {
    final gameplayWidget = GameplayView(arguments: GameplayViewArguments(level: 1));

    await tester.wrapAndPump(gameplayWidget);

    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    expect(find.byIcon(Icons.visibility_outlined), findsNothing);

    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility_off_outlined), findsNothing);
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });

  testWidgets('gameplay view elements learning mode test', (WidgetTester tester) async {
    final gameplayWidget = GameplayView(arguments: GameplayViewArguments(level: 1));

    await tester.wrapAndPump(gameplayWidget);

    expect(find.text('Score: 0'), findsNothing);
    expect(find.byType(LinearProgressIndicator), findsNothing);
  });

  testWidgets('gameplay view elements chalenge mode test', (WidgetTester tester) async {
    final gameplayWidget =
        GameplayView(arguments: GameplayViewArguments(chalengeLevel: ChalengeLevel.expert));

    await tester.wrapAndPump(gameplayWidget);

    expect(find.text('Score: 0'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
}
