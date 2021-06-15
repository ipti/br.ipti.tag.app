import 'package:br_ipti_tag_app/app/domain/data/entities/user.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  Future<Either<Exception, User>> call() async => Right(User(1, "", ""));
}
