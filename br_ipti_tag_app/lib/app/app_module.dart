import 'package:br_ipti_tag_app/app/modules/student/student_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [Bind.singleton((i) => Dio())];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/", module: StudentModule())
  ];
}
