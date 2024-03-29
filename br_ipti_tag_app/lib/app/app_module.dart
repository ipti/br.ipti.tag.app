import 'package:br_ipti_tag_app/app/core/network/custom_dio/custom_dio.dart';
import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/network/service/router.dart';
import 'core/plataform/pkg_info_service.dart';
import 'features/auth/auth_module.dart';
import 'features/classroom/classroom_module.dart';

import 'features/meals/meals_module.dart';
import 'features/student/student_module.dart';
import 'features/teacher/teacher_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.singleton<SessionService>((i) => SessionServiceImpl()),
    Bind.singleton<SessionBloc>((i) => SessionBloc(i.get())),
    Bind.singleton((i) => PackageInfoServiceImpl()),
    Bind.factory((i) => ClientHTTPConfiguration.apply(Dio())),
    Bind.factory((i) => RouterAPI(i.get<Dio>()))
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      "/",
      module: AuthModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/merenda",
      module: MealsModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/alunos",
      module: StudentModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/professores",
      module: TeacherModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/turmas",
      module: ClassroomModule(),
      transition: TransitionType.noTransition,
    )
  ];
}
