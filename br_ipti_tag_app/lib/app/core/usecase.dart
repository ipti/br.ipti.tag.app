import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Exception, Type>> call(Params args);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
