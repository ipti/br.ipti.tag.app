import 'package:br_ipti_tag_app/app/features/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  static String routeName = '/home';

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController()),
    // Bind.singleton((i) => UserService(i.get())),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute('/', child: (_, args) => const HomePage())
  ];
}
