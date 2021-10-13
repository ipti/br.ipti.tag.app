import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUsecase implements Usecase<void, NoParams> {
  LogoutUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, void>> call(NoParams params) async {
    final result = await _repository.logout();
    return result;
  }
}
