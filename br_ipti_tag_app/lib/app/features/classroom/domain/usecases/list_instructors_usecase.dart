import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ListInstructorsUseCase
    implements Usecase<List<InstructorEntity>, NoParams> {
  final ClassroomRepository _repositoryClassroom;
  ListInstructorsUseCase(this._repositoryClassroom);
  @override
  Future<Either<Exception, List<InstructorEntity>>> call(NoParams param) async {
    return _repositoryClassroom.listInstructors();
  }
}
