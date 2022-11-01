import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';
import 'package:tag_sdk/src/features/meals/domain/repositories/ingredient_repository.dart';

class ListIngredientUsecase implements Usecase<List<Ingredient>, EmptyParams> {
  ListIngredientUsecase(this._repositoryIngredient);

  final IngredientRepository _repositoryIngredient;

  @override
  Future<Either<Exception, List<Ingredient>>> call(EmptyParams params) async {
    final result = await _repositoryIngredient.list();

    return result;
  }
}
