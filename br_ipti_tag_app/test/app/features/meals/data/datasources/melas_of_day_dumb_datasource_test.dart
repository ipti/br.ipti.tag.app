import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_menu_dumb_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: type_annotate_public_apis
void main() {
  MealsMenuDumbDataSourceImpl datasource;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    datasource = MealsMenuDumbDataSourceImpl();
  });
  test("List Json File", () async {
    final result = await datasource.list();
    expect(result, isNotNull);
  });
}
