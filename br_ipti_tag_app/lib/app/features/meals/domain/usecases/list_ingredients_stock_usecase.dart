import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/food.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';

class ListIngredientUsecase
    implements Usecase<List<InvetoryIngredient>, NoParams> {
  ListIngredientUsecase(this._repositoryIngredient);

  final IngredientRepository _repositoryIngredient;

  @override
  Future<Either<Exception, List<InvetoryIngredient>>> call(
    NoParams params,
  ) async {
    List<InvetoryIngredient> dumb = [
      InvetoryIngredient(
        food: Food(description: "Feijão", tacoId: 1, scientificName: "Feijo"),
        foodId: "",
        amount: 10,
        expirationDate: DateTime.now(),
        measurementUnit: MeasurementUnits.Quilogramas,
        source: FoodSource.AgriculturaFamiliar,
        schoolId: "",
        objectId: '',
      ),
      InvetoryIngredient(
        food: Food(description: "Arroz", tacoId: 1, scientificName: "Feijo"),
        foodId: "",
        amount: 10,
        expirationDate: DateTime.now(),
        measurementUnit: MeasurementUnits.Quilogramas,
        source: FoodSource.AgriculturaFamiliar,
        schoolId: "",
        objectId: '',
      ),
      InvetoryIngredient(
        food: Food(description: "Carne", tacoId: 1, scientificName: "Feijo"),
        foodId: "",
        amount: 10,
        expirationDate: DateTime.now(),
        measurementUnit: MeasurementUnits.Quilogramas,
        source: FoodSource.AgriculturaFamiliar,
        schoolId: "",
        objectId: '',
      ),
    ];

    return right(dumb);
    // final result = await _repositoryIngredient.list();
    // return result;
  }
}
