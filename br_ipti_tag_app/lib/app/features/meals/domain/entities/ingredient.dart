class Ingredient {
  Ingredient({
    this.id,
    required this.name,
    required this.amount,
    required this.available,
    required this.substitutionSuggestion,
  });

  final String? id;
  final String name;
  final num amount;
  final bool available;
  final List<Ingredient>? substitutionSuggestion;

  @override
  String toString() {
    return '$amount $name';
  }
}
