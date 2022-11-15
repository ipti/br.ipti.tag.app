import 'package:tag_ui/tag_ui.dart';

abstract class AppRoutes {
  static const auth = TagPath("/auth/", "Login");
  // School
  static const escola = TagPath("/escola/", "Escola");
  // Classroom
  static const turmas = TagPath("/turmas/", "Turmas");
  // Students
  static const alunos = TagPath("/alunos/", "Alunos");
  // Teachers
  static const professores = TagPath("/professores/", "Professores");
  // Frequency
  static const frequencia = TagPath("/frequencia/", "Frequencia");
  // Meals
  static const merenda = TagPath("/merenda/", "Merenda");
  // Logout
  static const logout = TagPath("/logout/", "Logout");
}
