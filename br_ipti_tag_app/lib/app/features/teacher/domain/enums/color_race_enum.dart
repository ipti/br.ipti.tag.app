enum ColorRace {
  NAO_DECLARADA,
  BRANCA,
  PRETA,
  PARDA,
  AMARELA,
  INDIGENA,
}

extension ColorRaceExtensions on ColorRace {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case ColorRace.NAO_DECLARADA:
        return "Não declarada";
      case ColorRace.BRANCA:
        return "Branca";
      case ColorRace.PRETA:
        return "Preta";
      case ColorRace.PARDA:
        return "Parda";
      case ColorRace.AMARELA:
        return "Amarela";
      case ColorRace.INDIGENA:
        return "Indígena";
    }
  }
}
