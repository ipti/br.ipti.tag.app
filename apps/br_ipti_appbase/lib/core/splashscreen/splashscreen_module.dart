import 'package:br_ipti_appbase/core/splashscreen/splashscreen.dart';
import 'package:br_ipti_appbase/core/splashscreen/splashscreen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => [
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
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
