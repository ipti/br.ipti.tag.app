import 'dart:convert';

import 'package:tag_sdk/src/features/meals/data/models/food_model.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/inventory_ingredient.dart';

class InvetoryIngredientModel extends InvetoryIngredient {
  InvetoryIngredientModel({
    required super.foodId,
    required super.schoolId,
    required super.amount,
    super.source = FoodSource.Varejista,
    super.measurementUnit = MeasurementUnits.Gramas,
    required super.expirationDate,
    super.food,
  });

  @override
  factory InvetoryIngredientModel.fromMap(Map<String, dynamic> map) {
    return InvetoryIngredientModel(
      foodId: map['foodId'] as String,
      schoolId: map['schoolId'] as String,
      amount: num.parse(map['amount'] as String),
      expirationDate:
          DateTime.fromMillisecondsSinceEpoch(map['expirationDate'] as int),
      food: FoodModel.fromMap(map['food'] as Map<String, dynamic>),
    );
  }

  static List<InvetoryIngredient> fromList(List list) {
    final result = list
        .map(
          (e) => InvetoryIngredientModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return result;
  }

  // ignore: long-parameter-list
  InvetoryIngredient copyWith({
    String? foodId,
    String? schoolId,
    num? amount,
    FoodSource? source,
    MeasurementUnits? measurementUnit,
    DateTime? expirationDate,
  }) {
    return InvetoryIngredient(
      foodId: foodId ?? this.foodId,
      schoolId: schoolId ?? this.schoolId,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      expirationDate: expirationDate ?? this.expirationDate,
      food: food,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'foodId': foodId,
      'schoolId': schoolId,
      'amount': amount,
      'expirationDate': expirationDate.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(
        toMap(),
      );

  @override
  String toString() {
    return '''
    InvetoryIngredient(foodId: $foodId, schoolId: $schoolId, 
    amount: $amount, source: $source, measurementUnit: $measurementUnit, 
    expirationDate: $expirationDate)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvetoryIngredient &&
        other.foodId == foodId &&
        other.schoolId == schoolId &&
        other.amount == amount &&
        other.source == source &&
        other.measurementUnit == measurementUnit &&
        other.expirationDate == expirationDate;
  }

  @override
  int get hashCode {
    return foodId.hashCode ^
        schoolId.hashCode ^
        amount.hashCode ^
        source.hashCode ^
        measurementUnit.hashCode ^
        expirationDate.hashCode;
  }
}
