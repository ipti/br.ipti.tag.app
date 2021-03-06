import 'package:bloc/bloc.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_response.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/verify_auth_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

  void setUsername(String username) => emit(state.copyWith(username: username));
  void setPassword(String password) => emit(state.copyWith(password: password));
  void setSchoolYear(String schoolYear) =>
      emit(state.copyWith(year: schoolYear));

  Future fetchVersion() async {
    final version = await servicePkgInfo.getVersion();
    emit(state.copyWith(appVersion: version));
  }

  Future verifyAuthToken() async {
    final result = await verifyAuthUsecase(NoParams());
    result.fold(
      (l) => null,
      (r) => Modular.to.pushReplacementNamed("/turmas"),
    );
  }

  Future submitLogin() async {
    final params = LoginParams(
      username: state.username,
      password: state.password,
      year: state.year,
    );

    final option = await authLoginUsecase(params);

    final result = option.fold(id, id);

    if (result is AuthResponse) {
      Modular.to.pushReplacementNamed("/turmas");
    } else if (result is RestClientException) {
      // ignore: avoid_print
      print(result.handledError());
    }
  }
}
