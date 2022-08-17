import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/meals_menu.dart';
import '../repositories/meals_menu_repository.dart';

class ListMealsMenuUsecase implements Usecase<List<MealsMenu>, NoParams> {
  ListMealsMenuUsecase(this._repositoryMealsMenu);

  final MealsMenuRepository _repositoryMealsMenu;

  @override
  Future<Either<Exception, List<MealsMenu>>> call(NoParams params) async {
    final result = await _repositoryMealsMenu.list();
    return result;
  }
}
