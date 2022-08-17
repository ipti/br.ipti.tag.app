enum ProfessorTipo {
  PROFESSOR,
  AUXILIAR,
  MONITOR,
  INTERPRETE,
}

extension ProfessorTipoExtensions on ProfessorTipo {
  int get id {
    return index;
  }

  String get name {
    switch (this) {
      case ProfessorTipo.PROFESSOR:
        return "Professor";
      case ProfessorTipo.AUXILIAR:
        return "Auxiliar";
      case ProfessorTipo.MONITOR:
        return "Monitor";
      case ProfessorTipo.INTERPRETE:
        return "Intérprete";
    }
  }
}
