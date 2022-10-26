import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';

import 'package:dartz/dartz.dart';

class ListInstructorsUsecase implements Usecase<List<Instructor>, NoParams> {
  ListInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Exception, List<Instructor>>> call(NoParams params) async {
    final result = await _repositoryInstructor.listAll();

    return result;
  }
}
