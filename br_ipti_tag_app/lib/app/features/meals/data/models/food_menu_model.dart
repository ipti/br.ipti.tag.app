import 'dart:convert';

import 'package:collection/collection.dart';

import 'meal_model.dart';

class FoodMenuModel {
  FoodMenuModel({
    this.referenceDates,
    this.ageRange,
    this.id,
    this.description,
    this.observation,
    this.meals,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final List<String>? referenceDates;
  final List<int>? ageRange;
  final String? id;
  final String? description;
  final dynamic observation;
  final List<MealModel>? meals;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  FoodMenuModel copyWith({
    List<String>? referenceDates,
    List<int>? ageRange,
    String? id,
    String? description,
    dynamic observation,
    List<MealModel>? meals,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return FoodMenuModel(
      referenceDates: referenceDates ?? this.referenceDates,
      ageRange: ageRange ?? this.ageRange,
      id: id ?? this.id,
      description: description ?? this.description,
      observation: observation ?? this.observation,
      meals: meals ?? this.meals,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'referenceDates': referenceDates,
      'ageRange': ageRange,
      'id': id,
      'description': description,
      'observation': observation,
      'meals': meals?.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  factory FoodMenuModel.fromMap(Map<String, dynamic> map) {
    return FoodMenuModel(
      referenceDates: map['referenceDates'] != null
          ? List<String>.from(map['referenceDates'])
          : null,
      ageRange:
          map['ageRange'] != null ? List<int>.from(map['ageRange']) : null,
      id: map['id'],
      description: map['description'],
      observation: map['observation'],
      meals: map['meals'] != null
          ? List<MealModel>.from(map['meals']?.map((x) => MealModel.fromMap(x)))
          : null,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodMenuModel.fromJson(String source) =>
      FoodMenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''
    FoodMenuModel(referenceDates: $referenceDates, ageRange: $ageRange, id: $id,
    description: $description,observation: $observation, meals: $meals, 
    createdAt: $createdAt, updatedAt: $updatedAt, v: $v)
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is FoodMenuModel &&
        listEquals(other.referenceDates, referenceDates) &&
        listEquals(other.ageRange, ageRange) &&
        other.id == id &&
        other.description == description &&
        other.observation == observation &&
        listEquals(other.meals, meals) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return referenceDates.hashCode ^
        ageRange.hashCode ^
        id.hashCode ^
        description.hashCode ^
        observation.hashCode ^
        meals.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
