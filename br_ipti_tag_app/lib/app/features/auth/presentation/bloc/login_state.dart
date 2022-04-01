part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();

  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState(this.message);

  @override
  List<Object?> get props => [message.hashCode];
}

class LoginSuccessState extends LoginState {
  final String message;

  const LoginSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginLoadedState extends LoginState {
  const LoginLoadedState({
    required this.username,
    required this.password,
    required this.appVersion,
    required this.year,
  });

  final String username;
  final String password;
  final String appVersion;
  final String year;

  LoginLoadedState copyWith({
    String? username,
    String? password,
    String? appVersion,
    String? year,
  }) {
    return LoginLoadedState(
      username: username ?? this.username,
      password: password ?? this.password,
      appVersion: appVersion ?? this.appVersion,
      year: year ?? this.year,
    );
  }

  @override
  List<Object?> get props => [username, password, appVersion, year];
}

class LoginInitial extends LoginLoadedState {
  LoginInitial()
      : super(
          username: "",
          password: "",
          appVersion: "0.0.0",
          year: DateTime.now().year.toString(),
        );

  @override
  List<Object> get props => [super.username, super.password, appVersion];
}
