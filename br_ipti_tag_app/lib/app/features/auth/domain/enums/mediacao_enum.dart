enum Mediacao {
  MEDIACAO_1,
  MEDIACAO_2,
  MEDIACAO_3,
}

extension MediacaoExtensions on Mediacao {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case Mediacao.MEDIACAO_1:
        return "Mediação 1";
      case Mediacao.MEDIACAO_2:
        return "Mediação 2";
      case Mediacao.MEDIACAO_3:
        return "Mediação 3";
    }
  }
}
