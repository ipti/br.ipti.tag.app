enum AdmissionType {
  REMATRICULA,
  TRANSFERENCIA_INTERNA,
  TRANSFERENCIA_EXTERNA,
}

extension LabeledEnum on AdmissionType {
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
