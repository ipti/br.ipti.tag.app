// ignore_for_file: avoid_classes_with_only_static_members

class CheckIdDiscipline {
  static String? getIdDiscipline(List<String> disciplinesList, int index) {
    try {
      return disciplinesList.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
