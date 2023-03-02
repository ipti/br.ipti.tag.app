import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/biometrics_identification_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/student_list_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign_module.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tag_sdk/tag_sdk.dart';

const _urlWebSocket = "http://192.168.15.26:5000";

class BiometricsModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.factory<Socket>((i) => io(
        _urlWebSocket,
        OptionBuilder()
            .enableReconnection()
            .setPath('/socket.io')
            .enableForceNew()
            .setTimeout(300)
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

    Bind.singleton((i) => LocalStorageService()),

    // bloc
    Bind.singleton<LogoutUsecase>(
      (i) => LogoutUsecase(i.get<AuthRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      "/identification",
      module: BiometricsidentificationModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/sign",
      module: BiometricsSignModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      "/students",
      module: StudentListModule(),
      transition: TransitionType.noTransition,
    ),
  ];
}
