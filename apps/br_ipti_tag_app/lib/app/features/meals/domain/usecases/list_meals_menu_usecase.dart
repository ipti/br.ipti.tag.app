import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListMealsMenuUsecase implements Usecase<List<MealsMenu>, EmptyParams> {
  ListMealsMenuUsecase(this._repositoryMealsMenu);

  final MealsMenuRepository _repositoryMealsMenu;

  @override
  Future<Either<Failure, List<MealsMenu>>> call(EmptyParams params) async {
    final result = await _repositoryMealsMenu.list();

    return result;
  }
}
