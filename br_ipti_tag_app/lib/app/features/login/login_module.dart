import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginController()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage())
  ];
}
