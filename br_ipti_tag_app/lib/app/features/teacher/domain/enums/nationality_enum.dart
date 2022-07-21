enum Nationality {
  BRASILEIRA,
  BRASILEIRA_NASC_EXT,
  ESTRANGEIRA,
}

extension NationalityExtension on Nationality {
  int get id {
    return index + 1;
  }

  String get name {
    switch (this) {
      case Nationality.BRASILEIRA:
        return "Brasileira";
      case Nationality.BRASILEIRA_NASC_EXT:
        return "Brasileira: Nascido no exterior ou Naturalizado";
      case Nationality.ESTRANGEIRA:
        return "Estrangeira";
    }
  }
}
