import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/enrollment/enrollment_module.dart';
import 'modules/food/submodules/stock/stock_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [Bind.singleton((i) => Dio())];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      "/auth",
      module: LoginModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/merenda/estoque",
      module: StockModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/alunos",
      module: EnrollmentModule(),
      transition: TransitionType.noTransition,
    )
  ];
}
