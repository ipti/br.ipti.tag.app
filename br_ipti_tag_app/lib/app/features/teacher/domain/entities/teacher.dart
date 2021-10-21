class Teacher {
  Teacher({
    required this.name,
    this.cpf,
    required this.email,
    this.birthday,
  });

  final String name;
  final String? cpf;
  final String email;
  final DateTime? birthday;
}
