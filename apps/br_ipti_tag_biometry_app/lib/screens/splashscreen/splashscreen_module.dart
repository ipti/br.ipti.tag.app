import 'package:br_ipti_tag_biometry_app/screens/splashscreen/splashscreen.dart';
import 'package:br_ipti_tag_biometry_app/screens/splashscreen/splashscreen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../auth/domain/usecases/verify_auth_usecase.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => [
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.singleton(
          (i) => VerifyAuthUsecase(
        i.get<AuthRepositoryImpl>(),
      ),
    ),

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
