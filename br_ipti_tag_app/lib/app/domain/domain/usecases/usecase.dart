import 'package:dartz/dartz.dart';

abstract class Usecase<T> {
  Future<Either<Exception, T>> call(args);
}
