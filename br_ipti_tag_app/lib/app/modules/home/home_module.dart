import 'package:br_ipti_tag_app/app/domain/data/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:br_ipti_tag_app/app/modules/home/home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  static String routeName = '/home';

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController()),
    Bind.singleton((i) => UserRepository()),
    // Bind.singleton((i) => UserService(i.get())),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage())
  ];
}
