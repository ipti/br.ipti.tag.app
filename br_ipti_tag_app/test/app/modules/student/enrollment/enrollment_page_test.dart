import 'package:br_ipti_tag_app/app/modules/student/enrollment/enrollment_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('EnrollmentPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(EnrollmentPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}