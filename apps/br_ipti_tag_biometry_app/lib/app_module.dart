import 'package:br_ipti_tag_biometry_app/core/auth_interceptor.dart';
import 'package:br_ipti_tag_biometry_app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_biometry_app/screens/auth/auth_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/biometrics_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/splashscreen/splashscreen_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tag_network/tag_network.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>(
          (i) => Dio(BaseOptions(baseUrl: "http://192.168.2.1:3000"))
            ..interceptors.addAll(
              [
                AuthInterceptor(),
                // PrettyDioLogger(
                //     requestHeader: true,
                //     requestBody: true,
                //     responseBody: true,
                //     responseHeader: false,
                //     error: true,
                //     compact: true,
                //     maxWidth: 90)
              ],
            ),
        ),
        Bind.singleton<RouterAPI>(
          (i) => RouterAPI(
            i.get<Dio>(),
          ),
        ),

        Bind.singleton((i) => SessionServiceImpl()),

        // BlocBind.singleton<SessionBloc>(
        //   (i) => SessionBloc(
        //     i.get<SessionService>(),
        //   ),
        // ),
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
          "/auth",
          module: AuthModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/biometrics",
          module: BiometricsModule(),
          transition: TransitionType.noTransition,
        ),
      ];
}
