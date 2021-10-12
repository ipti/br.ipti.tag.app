import 'package:bloc/bloc.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/entities/auth_token.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(this.authLoginUsecase) : super(const LoginInitial());

  final AuthLoginUsecase authLoginUsecase;

  void setEmail(String value) => emit(state.copyWith(email: value));
  void setPassword(String value) => emit(state.copyWith(password: value));

  Future submitLogin() async {
    final params = LoginParams(email: state.email, password: state.password);
    final option = await authLoginUsecase(params);
    final result = option.fold(id, id);

    if (result is AuthToken) {
      print(result.accessToken);
    } else if (result is RestClientException) {
      print(result.handledError());
    }
  }
}
