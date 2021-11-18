import 'dart:convert';

import 'package:collection/collection.dart';

import 'component_model.dart';

class MealModel {
  MealModel({
    this.weekDays,
    this.id,
    this.description,
    this.observation,
    this.mealType,
    this.components,
    this.createdAt,
    this.updatedAt,
  });

  final List<String>? weekDays;
  final String? id;
  final String? description;
  final String? observation;
  final String? mealType;
  final List<ComponentModel>? components;
  final String? createdAt;
  final String? updatedAt;

  MealModel copyWith({
    List<String>? weekDays,
    String? id,
    String? description,
    String? observation,
    String? mealType,
    List<ComponentModel>? components,
    String? createdAt,
    String? updatedAt,
  }) {
    return MealModel(
      weekDays: weekDays ?? this.weekDays,
      id: id ?? this.id,
      description: description ?? this.description,
      observation: observation ?? this.observation,
      mealType: mealType ?? this.mealType,
      components: components ?? this.components,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weekDays': weekDays,
      'id': id,
      'description': description,
      'observation': observation,
      'mealType': mealType,
      'components': components?.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      weekDays:
          map['weekDays'] != null ? List<String>.from(map['weekDays']) : null,
      id: map['id'],
      description: map['description'],
      observation: map['observation'],
      mealType: map['mealType'],
      components: map['components'] != null
          ? List<ComponentModel>.from(
              map['components']?.map((x) => ComponentModel.fromMap(x)))
          : null,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''
      MealModel(weekDays: $weekDays, id: $id, description: $description, 
      observation: $observation, mealType: $mealType, components: $components,
      createdAt: $createdAt, updatedAt: $updatedAt)
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is MealModel &&
        listEquals(other.weekDays, weekDays) &&
        other.id == id &&
        other.description == description &&
        other.observation == observation &&
        other.mealType == mealType &&
        listEquals(other.components, components) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return weekDays.hashCode ^
        id.hashCode ^
        description.hashCode ^
        observation.hashCode ^
        mealType.hashCode ^
        components.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
