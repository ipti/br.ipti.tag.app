enum FilliationType {
  NAO_POSSUI,
  PAI_MAE,
}

extension FilliationTypeExtension on FilliationType {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case FilliationType.NAO_POSSUI:
        return "Não declarado/Ignorado";
      case FilliationType.PAI_MAE:
        return "Pai e/ou Mãe";
    }
  }
}
