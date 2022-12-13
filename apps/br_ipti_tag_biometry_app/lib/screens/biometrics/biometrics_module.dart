import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/school_entrance.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/student_list_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class BiometricsModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  // @override
  // final List<Bind> binds = [
  //   // bloc
  //   Bind.singleton(
  //     (i) => LoginBloc(
  //       i.get<AuthLoginUsecase>(),
  //       // i.get<PackageInfoService>(),
  //     ),
  //   ),
  // ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const SchoolEntrance(),
    ),
    ModuleRoute(
      "/students",
      module: StudentListModule(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      "/sign/:student",
      child: (_, args) =>
          BiometricsSign(student: args.data as StudentIdentification),
    ),
  ];
}
