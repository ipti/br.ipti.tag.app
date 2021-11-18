import 'dart:convert';

import 'package:collection/collection.dart';

class IngredientModel {
  IngredientModel({
    this.alternatives,
    this.id,
    this.foodId,
    this.amount,
    this.measurementUnit,
    this.replaceable,
    this.createdAt,
    this.updatedAt,
  });

  final List<String>? alternatives;
  final String? id;
  final String? foodId;
  final num? amount;
  final String? measurementUnit;
  final bool? replaceable;
  final String? createdAt;
  final String? updatedAt;

  IngredientModel copyWith({
    List<String>? alternatives,
    String? id,
    String? foodId,
    num? amount,
    String? measurementUnit,
    bool? replaceable,
    String? createdAt,
    String? updatedAt,
  }) {
    return IngredientModel(
      alternatives: alternatives ?? this.alternatives,
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      amount: amount ?? this.amount,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      replaceable: replaceable ?? this.replaceable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alternatives': alternatives,
      'id': id,
      'foodId': foodId,
      'amount': amount,
      'measurementUnit': measurementUnit,
      'replaceable': replaceable,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    final alternatives =
        map['alternatives'] != null ? map['alternatives'] as List : [];

    return IngredientModel(
        id: map['id'] as String?,
        foodId: map['foodId'] as String?,
        amount: map['amount'] as num?,
        measurementUnit: map['measurementUnit'] as String?,
        replaceable: map['replaceable'] as bool?,
        createdAt: map['createdAt'] as String?,
        updatedAt: map['updatedAt'] as String?,
        alternatives: List<String>.from(alternatives));
  }

  String toJson() => json.encode(toMap());

  factory IngredientModel.fromJson(String source) =>
      IngredientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''
      IngredientModel(alternatives: $alternatives, id: $id, foodId: $foodId, 
      amount: $amount, measurementUnit: $measurementUnit, 
      replaceable: $replaceable, createdAt: $createdAt, updatedAt: $updatedAt)
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is IngredientModel &&
        listEquals(other.alternatives, alternatives) &&
        other.id == id &&
        other.foodId == foodId &&
        other.amount == amount &&
        other.measurementUnit == measurementUnit &&
        other.replaceable == replaceable &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return alternatives.hashCode ^
        id.hashCode ^
        foodId.hashCode ^
        amount.hashCode ^
        measurementUnit.hashCode ^
        replaceable.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
