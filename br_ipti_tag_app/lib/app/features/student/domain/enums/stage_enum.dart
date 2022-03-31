enum Stage {
  None,
  INFANTIL,
  FUNDAMENTAL_MENOR,
  FUNDAMENTAL_MAIOR,
  MEDIO,
  PROFISSIONAL,
  EJA,
  OUTROS,
}

extension StageExtension on Stage {
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
      case Stage.None:
        return "";
    }
  }
}
