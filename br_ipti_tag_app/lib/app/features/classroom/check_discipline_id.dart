class CheckIdDiscipline {
  static String? getIdDiscipline(List<String> disciplinesList, int index) {
    try {
      return disciplinesList.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
