import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/meals_of_day.dart';
import '../repositories/meals_of_day_repository.dart';

class ListMealsOfDayUsecase implements Usecase<List<MealsOfDay>, NoParams> {
  ListMealsOfDayUsecase(this._repositoryMealsOfDay);

  final MealsOfDayRepository _repositoryMealsOfDay;

  @override
  Future<Either<Exception, List<MealsOfDay>>> call(NoParams params) async {
    final result = await _repositoryMealsOfDay.list();
    return result;
  }
}
