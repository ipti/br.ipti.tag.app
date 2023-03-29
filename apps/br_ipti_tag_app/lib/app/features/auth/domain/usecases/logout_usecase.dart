import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class LogoutUsecase implements Usecase<void, EmptyParams> {
  LogoutUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(EmptyParams params) async {
    final result = await _repository.logout();

    return result;
  }
}
