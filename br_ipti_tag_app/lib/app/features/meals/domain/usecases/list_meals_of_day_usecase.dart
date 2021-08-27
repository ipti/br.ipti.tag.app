import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import '../entities/meals_of_day.dart';
import '../repositories/meals_of_day_repository.dart';

import 'package:dartz/dartz.dart';

class ListMealsOfDayUsecase implements Usecase<List<MealsOfDay>, NoParams> {
  final MealsOfDayRepository _repositoryMealsOfDay;

  ListMealsOfDayUsecase(this._repositoryMealsOfDay);

  @override
  Future<Either<Exception, List<MealsOfDay>>> call(NoParams params) async {
    await Future.delayed(Duration(seconds: 2));
    final result = await _repositoryMealsOfDay.list();
    return result;
  }
}
