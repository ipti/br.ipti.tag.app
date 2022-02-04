part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.username,
    required this.password,
    required this.appVersion,
    required this.year,
  });

  final String username;
  final String password;
  final String appVersion;
  final String year;

  LoginState copyWith({
    String? username,
    String? password,
    String? appVersion,
    String? year,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      appVersion: appVersion ?? this.appVersion,
      year: year ?? this.year,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, password, appVersion, year];
}

class LoginInitial extends LoginState {
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
