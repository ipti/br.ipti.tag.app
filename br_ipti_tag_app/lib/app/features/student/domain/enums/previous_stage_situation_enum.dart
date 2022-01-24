enum PreviousStageSituation {
  NAO_FREQUENTOU,
  REPROVADO,
  AFASTADO_TRANSFERENCIA,
  AFASTADO_ABANDONO,
  MATRICULA_EDUCACAO_INFANTIL
}

extension LabeledEnum on PreviousStageSituation {
  String get name {
    switch (this) {
      case PreviousStageSituation.NAO_FREQUENTOU:
        return "Não frequentou";
      case PreviousStageSituation.REPROVADO:
        return "Reprovado";
      case PreviousStageSituation.AFASTADO_TRANSFERENCIA:
        return "Afastado por transferência";
      case PreviousStageSituation.AFASTADO_ABANDONO:
        return "Afastado por abandono";
      case PreviousStageSituation.MATRICULA_EDUCACAO_INFANTIL:
        return "Matrícula final em Educação Infantil";
    }
  }
}
