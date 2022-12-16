import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/controller/identification/controller.dart';
import 'package:br_ipti_tag_biometry_app/controller/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/school_entrance.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/student_list_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tag_sdk/tag_sdk.dart';

class BiometricsModule extends Module {
  static const _urlWebSocket = "http://192.168.15.23:5000";

  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // bloc
    Bind.singleton<LogoutUsecase>(
      (i) => LogoutUsecase(i.get<AuthRepository>()),
    ),
    // controllers
    Bind.singleton<Socket>((i) => io(
        _urlWebSocket,
        OptionBuilder()
            .enableReconnection()
            .setPath('/socket.io')
            .enableForceNew()
            .enableForceNewConnection()
            .setExtraHeaders(
                {'Connection': 'Upgrade', 'Origin': '127.0.0.1'}) // optional
            .setTransports(['websocket']).build())),

    Bind.factory(
      (i) => StreamSocket(),
    ),
    Bind.factory(
      (i) => BiometricsService(i.get<StreamSocket>(), i.get<Socket>()),
    ),

    Bind.singleton(
      ((i) => ControllerSign(
            i.get<BiometricsService>(),
          )),
    ),
    Bind.singleton<ControllerIdentification>(
      (i) => ControllerIdentification(
        i.get<BiometricsService>(),
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
