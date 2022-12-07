enum Modalidades {
  ENSINO_REGULAR,
  EDUCACAO_ESPECIAL,
  EJA,
}

extension ModalidadesExtensions on Modalidades {
  int get id {
    return index;
  }

  String get name {
    switch (this) {
      case Modalidades.ENSINO_REGULAR:
        return "Ensino Regular";
      case Modalidades.EDUCACAO_ESPECIAL:
        return "Educação Especial";
      case Modalidades.EJA:
        return "Educação de Jovens e Adultos (EJA)";
    }
  }
}
