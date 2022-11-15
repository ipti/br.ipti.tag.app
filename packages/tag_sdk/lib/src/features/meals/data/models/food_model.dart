import 'dart:convert';

import 'package:tag_sdk/src/features/meals/domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel({
    required super.tacoId,
    required super.description,
    required super.scientificName,
  });

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      tacoId: map['tacoId'] as num,
      description: map['description'] as String,
      scientificName: map['scientificName'] as String,
    );
  }
  static List<Food> fromList(List list) {
    final result = list
        .map(
          (e) => FoodModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return result;
  }

  String toJson() => json.encode(
        toMap(),
      );

  FoodModel copyWith({
    num? tacoId,
    String? description,
    String? scientificName,
  }) {
    return FoodModel(
      tacoId: tacoId ?? this.tacoId,
      description: description ?? this.description,
      scientificName: scientificName ?? this.scientificName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tacoId': tacoId,
      'description': description,
      'scientificName': scientificName,
    };
  }

  @override
  String toString() => '''
      FoodModel(tacoId: $tacoId, description: $description, 
      scientificName: $scientificName)
  ''';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodModel &&
        other.tacoId == tacoId &&
        other.description == description &&
        other.scientificName == scientificName;
  }

  @override
  int get hashCode =>
      tacoId.hashCode ^ description.hashCode ^ scientificName.hashCode;
}
