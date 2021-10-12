import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';

class ListIngredientUsecase
    implements Usecase<List<InvetoryIngredient>, NoParams> {
  ListIngredientUsecase(this._repositoryIngredient);

  final IngredientRepository _repositoryIngredient;

  @override
  Future<Either<Exception, List<InvetoryIngredient>>> call(
      NoParams params) async {
    final result = await _repositoryIngredient.list();
    return result;
  }
}
