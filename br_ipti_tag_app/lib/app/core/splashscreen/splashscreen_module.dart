import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/core/splashscreen/splashscreen.dart';
import 'package:br_ipti_tag_app/app/core/splashscreen/splashscreen_controller.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/auth/domain/usecases/verify_auth_usecase.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // datasources
    Bind.singleton<AuthRemoteDataSource>(
      (i) => AuthRemoteDataSourceImpl(
        i.get(),
      ),
    ),
    // repository
    Bind.singleton(
      (i) => AuthRespositoryImpl(
        authRemoteDataSource: i.get(),
        sessionService: i.get(),
      ),
    ),
    // usecases
    Bind.singleton((i) => VerifyAuthUsecase(
          i.get<AuthRepository>(),
        )),
    // controller
    Bind.singleton((i) => SplashScreenController(
          i.get<VerifyAuthUsecase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const SplashScreen(),
    ),
  ];
}
