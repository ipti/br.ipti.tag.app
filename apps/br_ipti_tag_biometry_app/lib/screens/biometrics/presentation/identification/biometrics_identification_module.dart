import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/school_entrance.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../auth/domain/usecases/logout_usecase.dart';

class BiometricsidentificationModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // bloc
    Bind.singleton<LogoutUsecase>(
      (i) => LogoutUsecase(i.get<AuthRepositoryImpl>()),
    ),
    // controllers

    Bind.singleton<ControllerIdentification>(
      (i) => ControllerIdentification(
        i.get<BiometricsService>(),
        i.get<LocalStorageService>(),
      ),
      onDispose: (bloc) => bloc.dispose(),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const SchoolEntrance(),
    ),
  ];
}
