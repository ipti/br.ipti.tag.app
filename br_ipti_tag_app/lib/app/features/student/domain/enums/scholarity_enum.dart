enum Scholarity {
  NAO_SABE_LER_ESCREVER,
  SABE_LER_ESCREVER,
  ENS_FUND_INCOMPLETO,
  ENS_FUND_COMPLETO,
  ENS_MED_INCOMPLETO,
  ENS_MED_COMPLETO,
  ENS_SUP_INCOMPLETO,
  ENS_SUP_COMPLETO,
}

extension ScholarityExtension on Scholarity {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case Scholarity.NAO_SABE_LER_ESCREVER:
        return "Não sabe ler e escrever";
      case Scholarity.SABE_LER_ESCREVER:
        return "Sabe ler e escrever";
      case Scholarity.ENS_FUND_INCOMPLETO:
        return "Ens. Fund. Incompleto";
      case Scholarity.ENS_FUND_COMPLETO:
        return "Ens. Fund. Completo";
      case Scholarity.ENS_MED_INCOMPLETO:
        return "Ens. Med. Incompleto";
      case Scholarity.ENS_MED_COMPLETO:
        return "Ens. Med. Completo";
      case Scholarity.ENS_SUP_INCOMPLETO:
        return "Ens. Sup. Incompleto";
      case Scholarity.ENS_SUP_COMPLETO:
        return "Ens. Sup. Completo";
    }
  }
}
