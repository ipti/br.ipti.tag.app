import 'package:tag_ui/tag_ui.dart';

abstract class AppRoutes {
  static const auth = TagPath("/auth/", "Login");
  static const home = TagPath("/home/", "Início");
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
  // notes
  static const notes = TagPath("/notas", "Notas");
  // classPlan
  static const classPlan = TagPath("/classplan/", "Plano de aula");
}
