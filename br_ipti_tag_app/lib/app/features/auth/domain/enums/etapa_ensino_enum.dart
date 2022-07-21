enum EtapaEnsino {
  MANHA,
  TARDE,
  NOITE,
}

extension EtapaEnsinoExtensions on EtapaEnsino {
  int get id {
    return index;
  }

  String get name {
    switch (this) {
      case EtapaEnsino.MANHA:
        return "Manhã";
      case EtapaEnsino.TARDE:
        return "Tarde";
      case EtapaEnsino.NOITE:
        return "Noite";
    }
  }
}
