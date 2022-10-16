import 'food.dart';

enum FoodSource { Varejista, AgriculturaFamiliar }

enum MeasurementUnits { Gramas, Quilogramas, Litros, Pacote, Unidade }

class InvetoryIngredient {
  InvetoryIngredient({
    required this.foodId,
    required this.schoolId,
    required this.amount,
    required this.source,
    required this.measurementUnit,
    required this.expirationDate,
    this.food,
  });

  final String foodId;
  final String schoolId;
  final num amount;
  final FoodSource source;
  final MeasurementUnits measurementUnit;
  final DateTime expirationDate;
  final Food? food;

  @override
  String toString() {
    return '$amount ${food?.description ?? foodId}';
  }
}
