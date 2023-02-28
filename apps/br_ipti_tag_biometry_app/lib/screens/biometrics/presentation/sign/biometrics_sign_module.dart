import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class BiometricsSignModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
        StudentSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // bloc
    Bind.singleton<LogoutUsecase>(
      (i) => LogoutUsecase(i.get<AuthRepository>()),
    ),
    // controllers

    Bind.singleton(
      (i) => LoadStudentUsecase(i.get<StudentRepository>()),
    ),

    Bind.singleton<ControllerSign>(
      (i) => ControllerSign(
        authRepository: i.get<AuthRepository>(),
        biometricsService: i.get<BiometricsService>(),
        loadStudentUsecase: i.get<LoadStudentUsecase>(),
        localStorageService: i.get<LocalStorageService>(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/:student",
      child: (_, args) =>
          BiometricsSign(studentId: int.parse(args.params["student"])),
    ),
  ];
}
