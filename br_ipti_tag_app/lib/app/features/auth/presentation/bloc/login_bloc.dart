import 'package:bloc/bloc.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';
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
  ) : super(const LoginInitial());

  final AuthLoginUsecase authLoginUsecase;
  final VerifyAuthUsecase verifyAuthUsecase;

  void setEmail(String value) => emit(state.copyWith(email: value));
  void setPassword(String value) => emit(state.copyWith(password: value));

  Future verifyAuthToken() async {
    final result = await verifyAuthUsecase(NoParams());
    result.fold(
      (l) => null,
      (r) => Modular.to.pushReplacementNamed("/turmas"),
    );
  }

  Future submitLogin() async {
    final params = LoginParams(email: state.email, password: state.password);
    final option = await authLoginUsecase(params);
    final result = option.fold(id, id);

    if (result is AuthToken) {
      Modular.to.pushReplacementNamed("/turmas");
    } else if (result is RestClientException) {
      // ignore: avoid_print
      print(result.handledError());
    }
  }
}
