import 'package:dartz/dartz.dart';

abstract class Usecase<Type, EmptyParams> {
  Future<Either<Exception, Type>> call(EmptyParams params);
}
