import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_of_day_dumb_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  MealsOfDayDumbDataSourceImpl datasource;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    datasource = MealsOfDayDumbDataSourceImpl();
  });
  test("List Json File", () async {
    final result = await datasource.list();
    expect(result, isNotNull);
  });
}
