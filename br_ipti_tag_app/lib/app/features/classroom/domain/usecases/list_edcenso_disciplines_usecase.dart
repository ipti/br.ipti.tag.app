import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ListEdcensoDisciplinesUseCase implements Usecase<List<EdcensoDisciplinesEntity>, NoParams>{
    final ClassroomRepository _repositoryClassroom;
    ListEdcensoDisciplinesUseCase(this._repositoryClassroom);
  @override
  Future<Either<Exception, List<EdcensoDisciplinesEntity>>> call(NoParams params) async {
    return _repositoryClassroom.listEdcensoDisciplines();
  }
} 