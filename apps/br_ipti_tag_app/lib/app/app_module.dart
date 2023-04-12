import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/core/splashscreen/splashscreen_module.dart';
import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';
import 'package:br_ipti_tag_app/app/features/school/school_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_network/tag_network.dart';

import 'core/network/custom_dio/custom_dio.dart';
import 'core/plataform/pkg_info_service.dart';
import 'features/auth/auth_module.dart';
import 'features/class_plan/class_plan_module.dart';
import 'features/classroom/classroom_module.dart';
import 'features/frequency/frequency_module.dart';
import 'features/home/home_module.dart';
import 'features/meals/meals_module.dart';
import 'features/student/student_module.dart';
import 'features/teacher/teacher_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>(
          (i) => ClientHTTPConfiguration.apply(
            Dio(),
          ),
        ),
        Bind.singleton<RouterAPI>(
          (i) => RouterAPI(
            i.get<Dio>(),
          ),
        ),
        Bind.singleton<SessionService>(
          (i) => SessionServiceImpl(),
        ),
        BlocBind.singleton<SessionBloc>(
          (i) => SessionBloc(
            i.get<SessionService>(),
          ),
        ),
        Bind.singleton(
          (i) => PackageInfoServiceImpl(),
        ),

      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/",
          module: SplashScreenModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/home",
          module: HomeModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/auth",
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
          "/turmas/",
          module: ClassroomModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/escola",
          module: SchoolModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/frequencia",
          module: FrequencyModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/classplan",
          module: ClassPlan(),
          transition: TransitionType.noTransition,
        ),
      ];
}
