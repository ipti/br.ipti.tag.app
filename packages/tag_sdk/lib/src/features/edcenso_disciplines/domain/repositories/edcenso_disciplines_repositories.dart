import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';

abstract class EdcensoDisciplinesRepository {
  Future<Either<Exception, List<EdcensoDiscipline>>> listAll();
}
