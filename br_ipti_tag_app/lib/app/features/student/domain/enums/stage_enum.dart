enum Stage {
  INFANTIL,
  FUNDAMENTAL_MENOR,
  FUNDAMENTAL_MAIOR,
  MEDIO,
  PROFISSIONAL,
  EJA,
  OUTROS,
}

extension IndexLegacyParity on Stage {
  // Essa alteração é necessário pois no legado o indice começa em 1 e não em 0
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case Stage.INFANTIL:
        return "Infantil";
      case Stage.FUNDAMENTAL_MENOR:
        return "Fundamental Menor";
      case Stage.FUNDAMENTAL_MAIOR:
        return "Fundamental Maior";
      case Stage.MEDIO:
        return "Médio";
      case Stage.PROFISSIONAL:
        return "Profissional";
      case Stage.EJA:
        return "EJA";
      case Stage.OUTROS:
        return "Outros";
    }
  }
}
