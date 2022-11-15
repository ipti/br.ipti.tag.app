import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';

import '../entities/meals_menu.dart';
import '../repositories/meals_menu_repository.dart';

class ListMealsMenuUsecase implements Usecase<List<MealsMenu>, EmptyParams> {
  ListMealsMenuUsecase(this._repositoryMealsMenu);

  final MealsMenuRepository _repositoryMealsMenu;

  @override
  Future<Either<Exception, List<MealsMenu>>> call(EmptyParams params) async {
    final result = await _repositoryMealsMenu.list();

    return result;
  }
}
