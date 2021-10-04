import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  IngredientModel({
    final String? name,
    final bool? available,
    final int? amount,
    final List<IngredientModel>? substitutionSuggestion,
  }) : super(
          name: name ?? "",
          available: available ?? false,
          amount: amount ?? 0,
          substitutionSuggestion: substitutionSuggestion,
        );

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      name: map['name'] as String?,
      available: map['available'] as bool?,
      amount: map['amount'] as int?,
      substitutionSuggestion: [],
    );
  }

  factory IngredientModel.fromJson(String source) =>
      IngredientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'available': available,
    };
  }

  String toJson() => json.encode(toMap());
}
