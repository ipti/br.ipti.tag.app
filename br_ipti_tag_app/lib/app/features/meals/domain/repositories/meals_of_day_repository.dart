import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_of_day.dart';
import 'package:dartz/dartz.dart';

abstract class MealsOfDayRepository {
  Future<Either<Exception, List<MealsOfDay>>> list();
}
