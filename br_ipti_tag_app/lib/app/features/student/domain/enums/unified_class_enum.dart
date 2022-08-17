enum UnifiedClass { CRECHE, PRE_ESCOLA }

extension UnifiedClassExtensions on UnifiedClass {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case UnifiedClass.CRECHE:
        return "CRECHE";
      case UnifiedClass.PRE_ESCOLA:
        return "PRÉ-ESCOLA";
    }
  }
}
