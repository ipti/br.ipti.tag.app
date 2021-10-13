part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.appVersion,
    required this.year,
  });

  final String email;
  final String password;
  final String appVersion;
  final String year;

  LoginState copyWith({
    String? email,
    String? password,
    String? appVersion,
    String? year,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      appVersion: appVersion ?? this.appVersion,
      year: year ?? this.year,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, appVersion, year];
}

class LoginInitial extends LoginState {
  LoginInitial()
      : super(
          email: "",
          password: "",
          appVersion: "0.0.0",
          year: DateTime.now().year.toString(),
        );

  @override
  List<Object> get props => [super.email, super.password, appVersion];
}
