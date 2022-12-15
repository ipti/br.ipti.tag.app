import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';

abstract class EdcensoDisciplinesRepository {
  Future<Either<Failure, List<EdcensoDiscipline>>> listAll();
}