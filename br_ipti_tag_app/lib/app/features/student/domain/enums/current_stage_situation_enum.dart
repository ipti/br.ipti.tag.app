enum CurrentStageSituation {
  PRIMEIRA_MATRICULA_NO_CURSO,
  PROMOVIDO,
  REPETENTE,
}

extension LabeledEnum on CurrentStageSituation {
  String get name {
    switch (this) {
      case CurrentStageSituation.PRIMEIRA_MATRICULA_NO_CURSO:
        return "Não frequentou";
      case CurrentStageSituation.PROMOVIDO:
        return "Reprovado";
      case CurrentStageSituation.REPETENTE:
        return "Afastado por transferência";
    }
  }
}
