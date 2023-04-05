import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class UpdateAuthUsecase implements Usecase<UserModel, EmptyParams> {
  UpdateAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, UserModel>> call(EmptyParams params) async {
    final result = await _repository.fetchUserData();

    return result;
  }
}
