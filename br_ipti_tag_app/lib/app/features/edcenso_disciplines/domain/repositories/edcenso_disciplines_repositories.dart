import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:dartz/dartz.dart';

abstract class EdcensoDisciplinesRepository {
  Future<Either<Exception, List<EdcensoDiscipline>>> listAll();
}
