import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../auth/domain/usecases/logout_usecase.dart';
import '../../../student/domain/usecases/load_student_usecase.dart';
import '../identification/controller.dart';

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
    Bind.singleton<LogoutUsecase>((i) => LogoutUsecase(i.get<AuthRepositoryImpl>())),

    // controllers
    Bind.singleton((i) => LoadStudentUsecase(i.get<StudentRepositoryImpl>())),

    Bind.singleton<ControllerIdentification>(
      (i) => ControllerIdentification(i.get<BiometricsService>(), i.get<LocalStorageService>()),
      onDispose: (bloc) => bloc.dispose(),
    ),

    Bind.singleton<ControllerSign>(
      (i) => ControllerSign(
        authRepository: i.get<AuthRepositoryImpl>(),
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
      child: (_, args) => BiometricsSign(studentId: int.parse(args.params["student"])),
    ),
  ];
}
