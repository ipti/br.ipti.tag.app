import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:br_ipti_tag_app/app/modules/student/student_module.dart';

void main() {
  setUpAll(() {
    initModule(StudentModule());
  });
}
