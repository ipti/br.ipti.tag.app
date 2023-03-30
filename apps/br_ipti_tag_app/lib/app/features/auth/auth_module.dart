import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/pages/auth_login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/verify_auth_usecase.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // usecases
    Bind.singleton(
          (i) => AuthLoginUsecase(
        i.get<AuthRepositoryImpl>(),
      ),
      export: true,
    ),
    Bind.singleton(
          (i) => VerifyAuthUsecase(
        i.get<AuthRepositoryImpl>(),
      ),
      export: true,
    ),
    // bloc
    Bind.singleton(
          (i) => LoginBloc(
        i.get<AuthLoginUsecase>(),
        i.get<PackageInfoService>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const AuthLoginPage(),
    ),
  ];
}
