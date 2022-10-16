class AuthLogin {
  AuthLogin({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  AuthLogin copyWith({
    String? username,
    String? password,
  }) {
    return AuthLogin(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
