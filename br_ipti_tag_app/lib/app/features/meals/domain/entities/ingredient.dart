class Ingredient {
  Ingredient({
    required this.name,
    required this.amount,
    required this.available,
    required this.substitutionSuggestion,
  });

  final String name;
  final int amount;
  final bool available;
  final List<Ingredient>? substitutionSuggestion;

  @override
  String toString() {
    return '$amount $name';
  }
}
