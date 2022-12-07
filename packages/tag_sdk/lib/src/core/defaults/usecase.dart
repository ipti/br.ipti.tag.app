import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';

abstract class Usecase<Type, EmptyParams> {
  Future<Either<Failure, Type>> call(EmptyParams params);
}
