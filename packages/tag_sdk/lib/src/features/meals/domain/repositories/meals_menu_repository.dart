import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meals_menu.dart';

abstract class MealsMenuRepository {
  Future<Either<Exception, List<MealsMenu>>> list();
}
