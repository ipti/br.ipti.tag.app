import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';

class ListIngredientUsecase implements Usecase<List<Ingredient>, NoParams> {
  ListIngredientUsecase(this._repositoryIngredient);

  final IngredientRepository _repositoryIngredient;

  @override
  Future<Either<Exception, List<Ingredient>>> call(NoParams params) async {
    final result = await _repositoryIngredient.list();
    return result;
  }
}
