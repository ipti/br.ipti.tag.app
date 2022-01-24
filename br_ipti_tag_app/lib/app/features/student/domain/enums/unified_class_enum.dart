enum UnifiedClass { CRECHE, PRE_ESCOLA }

extension IndexLegacyParity on UnifiedClass {
  String get name {
    switch (this) {
      case UnifiedClass.CRECHE:
        return "CRECHE";
      case UnifiedClass.PRE_ESCOLA:
        return "PRÉ-ESCOLA";
    }
  }
}
