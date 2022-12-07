import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';

abstract class IngredientRepository {
  Future<Either<Failure, List<Ingredient>>> list();
}
