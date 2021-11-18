import 'dart:convert';

import 'package:collection/collection.dart';

import 'ingredient_model.dart';

class ComponentModel {
  ComponentModel({
    this.id,
    this.description,
    this.observation,
    this.ingredients,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? description;
  final String? observation;
  final List<IngredientModel>? ingredients;
  final String? createdAt;
  final String? updatedAt;

  ComponentModel copyWith({
    String? id,
    String? description,
    String? observation,
    List<IngredientModel>? ingredients,
    String? createdAt,
    String? updatedAt,
  }) {
    return ComponentModel(
      id: id ?? this.id,
      description: description ?? this.description,
      observation: observation ?? this.observation,
      ingredients: ingredients ?? this.ingredients,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'observation': observation,
      'ingredients': ingredients?.map((x) => x.toMap()).toList() ?? [],
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      id: map['id'],
      description: map['description'],
      observation: map['observation'],
      ingredients: List<IngredientModel>.from(map['ingredients']?.map(
        (x) => IngredientModel.fromMap(x),
      )),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComponentModel.fromJson(String source) =>
      ComponentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''
      ComponentModel(id: $id, description: $description, 
      observation: $observation, ingredients: $ingredients, 
      createdAt: $createdAt, updatedAt: $updatedAt)
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ComponentModel &&
        other.id == id &&
        other.description == description &&
        other.observation == observation &&
        listEquals(other.ingredients, ingredients) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        observation.hashCode ^
        ingredients.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
