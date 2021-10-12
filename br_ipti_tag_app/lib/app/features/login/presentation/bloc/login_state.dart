part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(email: "", password: "");

  @override
  List<Object> get props => [super.email, super.password];
}
