import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/cubit/home_cubit.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // Cubit
    Bind.singleton((i) => HomeCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const HomePage(),
    ),
  ];
}
