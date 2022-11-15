extension EnumById<T extends Enum> on Iterable<T> {
  T? byId(int? id) {
    if (id == null) return null;
    for (final value in this) {
      if (value.index + 1 == id) return value;
    }

    return null;
  }
}
