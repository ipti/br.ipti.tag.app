import 'dart:convert';

import 'package:br_ipti_tag_app/app/core/model/model.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/food_model.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';

class InvetoryIngredientModel extends InvetoryIngredient implements Model {
  InvetoryIngredientModel({
    required String foodId,
    required String schoolId,
    required num amount,
    FoodSource source = FoodSource.Varejista,
    MeasurementUnits measurementUnit = MeasurementUnits.Gramas,
    required DateTime expirationDate,
    FoodModel? food,
  }) : super(
          foodId: foodId,
          schoolId: schoolId,
          amount: amount,
          source: source,
          measurementUnit: measurementUnit,
          expirationDate: expirationDate,
          food: food,
        );

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
        .map((e) => InvetoryIngredientModel.fromMap(e as Map<String, dynamic>))
        .toList();
    return result;
  }

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

  String toJson() => json.encode(toMap());

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
