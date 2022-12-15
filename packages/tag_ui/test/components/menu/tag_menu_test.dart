import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagMenu", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagMenu = TagMenu(
        onTapDefault: (route) {},
        currentPathMenu: '',
        items: [],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagMenu),
      );
      final Finder resultSearch = find.byType(TagMenu);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with itens", (WidgetTester tester) async {
      final tagMenu = TagMenu(
        onTapDefault: (route) {},
        currentPathMenu: '',
        items: [
          for (var i = 0; i < 30; i++)
            TagMenuItemProps(path: TagPath("", "titulo $i")),
        ],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagMenu),
      );
      final Finder resultSearch = find.byType(TagMenuItem);
      expect(resultSearch, findsWidgets);
    });
  });
}