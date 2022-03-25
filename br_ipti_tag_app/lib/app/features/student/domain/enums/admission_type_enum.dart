enum AdmissionType {
  REMATRICULA,
  TRANSFERENCIA_INTERNA,
  TRANSFERENCIA_EXTERNA,
}

extension AdmissionTypeExtension on AdmissionType {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case AdmissionType.REMATRICULA:
        return "Rematrícula";
      case AdmissionType.TRANSFERENCIA_INTERNA:
        return "Transferência interna";
      case AdmissionType.TRANSFERENCIA_EXTERNA:
        return "Transferência externa";
    }
  }
}
