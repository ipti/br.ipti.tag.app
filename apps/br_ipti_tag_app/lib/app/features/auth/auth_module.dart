import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/pages/auth_login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
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