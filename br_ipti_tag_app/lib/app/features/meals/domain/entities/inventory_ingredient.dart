import 'food.dart';

enum FoodSource { Varejista, AgriculturaFamiliar }
enum MeasurementUnits { Gramas, Quilogramas, Litros, Pacote, Unidade }

extension MapString on MeasurementUnits {
  String get name {
    switch (this) {
      case MeasurementUnits.Gramas:
        return "g";
      case MeasurementUnits.Litros:
        return "l";
      case MeasurementUnits.Pacote:
        return "pacote";
      case MeasurementUnits.Quilogramas:
        return "Kg";
      case MeasurementUnits.Unidade:
        return "unid";
      default:
        return "";
    }
  }
}

class InvetoryIngredient {
  InvetoryIngredient({
    required this.objectId,
    required this.foodId,
    required this.schoolId,
    required this.amount,
    required this.source,
    required this.measurementUnit,
    required this.expirationDate,
    this.food,
  });

  final String objectId;
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
