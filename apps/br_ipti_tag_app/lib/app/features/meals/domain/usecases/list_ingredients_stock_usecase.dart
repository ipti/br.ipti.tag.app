import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListIngredientUsecase implements Usecase<List<Ingredient>, EmptyParams> {
  ListIngredientUsecase(this._repositoryIngredient);

  final IngredientRepository _repositoryIngredient;

  @override
  Future<Either<Failure, List<Ingredient>>> call(EmptyParams params) async {
    final result = await _repositoryIngredient.list();

    return result;
  }
}
