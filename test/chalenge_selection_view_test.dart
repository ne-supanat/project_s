import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/features/chalenge_selection/chalenge_selection_view.dart';

import 'test_utils.dart';

void main() {
  testWidgets('test elements in chalenge selection view', (WidgetTester tester) async {
    const mainMenuWidget = ChalengeSelectionView();

    await tester.wrapAndPump(mainMenuWidget);

    expect(find.text('- Difficulty -'), findsOne);
    expect(find.text('Beginner'), findsOneWidget);
    expect(find.text('Normal'), findsOneWidget);
    expect(find.text('Expert'), findsOneWidget);

    expect(find.text('Back'), findsOneWidget);
  });
}
