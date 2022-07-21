import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/verify_auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(
    this.authLoginUsecase,
    this.verifyAuthUsecase,
    this.servicePkgInfo,
  ) : super(LoginInitial());

  final AuthLoginUsecase authLoginUsecase;
  final VerifyAuthUsecase verifyAuthUsecase;
  final PackageInfoService servicePkgInfo;

  final yearSequence = [
    for (var i = 2014; i <= DateTime.now().year; i++)
      MapEntry(i.toString(), i.toString())
  ];

  String username = "";
  String password = "";
  String schoolYear = DateTime.now().year.toString();
  String appVersion = "0.0.0.0";

  Future fetchVersion() async {
    final appVersion = await servicePkgInfo.getVersion();
    this.appVersion = appVersion;
    emit(
      LoginLoadedState(
        username: username,
        password: password,
        appVersion: appVersion,
        year: schoolYear,
      ),
    );
  }

  Future verifyAuthToken() async {
    final result = await verifyAuthUsecase(NoParams());
    result.fold(
      (l) => null,
      (r) => Modular.to.pushReplacementNamed("/turmas/"),
    );
  }

  Future submitLogin() async {
    final params = LoginParams(
      username: username,
      password: password,
      year: schoolYear,
    );

    final result = await authLoginUsecase(params);

    result.fold(
      (error) {
        emit(LoginErrorState(error.toString()));
        emit(
          LoginLoadedState(
            username: username,
            password: password,
            appVersion: appVersion,
            year: schoolYear,
          ),
        );
      },
      (auth) => Modular.to.pushReplacementNamed("/turmas/"),
    );
  }
}
