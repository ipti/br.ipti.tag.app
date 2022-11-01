enum Sex {
  MASCULINO,
  FEMININO,
}

extension SexExtension on Sex {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case Sex.MASCULINO:
        return "Masculino";
      case Sex.FEMININO:
        return "Feminino";
    }
  }
}
