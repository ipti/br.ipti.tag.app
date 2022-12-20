//import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(
    this.authLoginUsecase,
    // this.servicePkgInfo,
  ) : super(
          LoginInitial(),
        );

  final AuthLoginUsecase authLoginUsecase;
  // final PackageInfoService servicePkgInfo;

  final yearSequence = [
    for (var i = 2014; i <= DateTime.now().year; i++)
      MapEntry(
        i.toString(),
        i.toString(),
      ),
  ];

  String? username = "";
  String? password = "";
  String? schoolYear = DateTime.now().year.toString();
  String appVersion = "0.0.0.0";

  Future fetchVersion() async {
    // final appVersion = await servicePkgInfo.getVersion();
    emit(
      LoginLoadedState(
        username: username!,
        password: password!,
        appVersion: appVersion,
        year: schoolYear!,
      ),
    );
  }

  Future submitLogin() async {
    final params = LoginParams(
      username: username!,
      password: password!,
      year: schoolYear!,
    );

    final result = await authLoginUsecase(params);

    result.fold(
      (error) {
        emit(LoginErrorState(
          error.message,
        ));
        emit(
          LoginLoadedState(
            username: username!,
            password: password!,
            appVersion: appVersion,
            year: schoolYear!,
          ),
        );
      },
      (auth) => Modular.to.pushReplacementNamed("/biometrics"),
    );
  }
}
