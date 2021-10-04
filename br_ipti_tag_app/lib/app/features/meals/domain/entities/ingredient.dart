import 'package:meta/meta.dart';

class Ingredient {
  Ingredient({
    @required this.name,
    @required this.available,
    @required this.substitutionSuggestion,
  });

  final String name;
  final bool available;
  final List<Ingredient> substitutionSuggestion;
}
