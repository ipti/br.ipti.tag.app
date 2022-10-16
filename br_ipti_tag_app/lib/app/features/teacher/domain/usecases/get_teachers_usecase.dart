import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';

import 'package:dartz/dartz.dart';

class GetInstructorsUsecase
    implements Usecase<Instructor, GetInstructorParams> {
  GetInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Exception, Instructor>> call(GetInstructorParams params) async {
    final result = await _repositoryInstructor.getById(params.instructorId);

    return result;
  }
}

class GetInstructorParams {
  final String instructorId;

  GetInstructorParams(this.instructorId);
}
