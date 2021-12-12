import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Exception, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class IdParams extends Equatable {
  const IdParams({
    required this.objectId,
  });

  final String objectId;

  @override
  List<Object> get props => [objectId];
}
