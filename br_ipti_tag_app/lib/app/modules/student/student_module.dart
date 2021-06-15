import 'package:br_ipti_tag_app/app/modules/student/enrollment/enrollment_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: EnrollmentModule())
  ];
}
