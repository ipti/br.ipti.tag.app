import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:dartz/dartz.dart';

abstract class IngredientRepository {
  Future<Either<Exception, List<Ingredient>>> list();
  Future<Either<Exception, Ingredient>> create(Ingredient ingredient);
}
