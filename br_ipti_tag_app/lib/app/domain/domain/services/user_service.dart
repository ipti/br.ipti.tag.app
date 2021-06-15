import 'package:br_ipti_tag_app/app/domain/data/entities/user.dart';
import 'package:br_ipti_tag_app/app/domain/data/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserService {
  final UserRepository _repository;

  UserService(this._repository);

  Future<Either<Exception, List<User>>> listAll() async {
    try {
      final results = await _repository.listAll();
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }
}
