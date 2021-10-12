import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:dartz/dartz.dart';

abstract class IngredientRepository {
  Future<Either<Exception, List<InvetoryIngredient>>> list();
}
