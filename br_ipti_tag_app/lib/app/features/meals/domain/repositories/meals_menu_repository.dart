import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:dartz/dartz.dart';

abstract class MealsMenuRepository {
  Future<Either<Exception, List<MealsMenu>>> list();
}
