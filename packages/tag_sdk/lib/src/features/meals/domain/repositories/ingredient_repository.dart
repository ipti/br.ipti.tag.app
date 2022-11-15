import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';

abstract class IngredientRepository {
  Future<Either<Exception, List<Ingredient>>> list();
}
