import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tag_sdk/tag_sdk.dart';

class BiometricsSignModule extends Module {
  static const _urlWebSocket = "http://192.168.15.23:5000";

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
    Bind.factory<Socket>((i) => io(
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
      (i) => LoadStudentUsecase(i.get<StudentRepository>()),
    ),

    Bind.singleton<ControllerSign>(
      (i) => ControllerSign(
        authRepository: i.get<AuthRepository>(),
        biometricsService: i.get<BiometricsService>(),
        loadStudentUsecase: i.get<LoadStudentUsecase>(),
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
