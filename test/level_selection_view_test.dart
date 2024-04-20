import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/level_resource.dart';
import 'package:project_s/features/level_selection/level_selection_view.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/widgets/level_item.dart';

import 'test_utils.dart';
import 'test_utils.mocks.dart';

void main() async {
  final SharedPref sharedPref = MockSharedPref();

  setUpAll(() {
    GetIt.instance.registerSingleton<SharedPref>(sharedPref);
  });

  testWidgets('level selection view elements test', (WidgetTester tester) async {
    const levelSelectionWidget = LevelSelectionView();

    await tester.wrapAndPump(levelSelectionWidget);

    expect(find.byType(LevelItem), findsExactly(LevelResource().levels.length));
    expect(find.text('Back'), findsOneWidget);
  });
}
