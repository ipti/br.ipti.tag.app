import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';

import 'package:dartz/dartz.dart';

class CreateInstructorsUsecase
    implements Usecase<bool, CreateInstructorParams> {
  CreateInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Exception, bool>> call(
    CreateInstructorParams params,
  ) async {
    final result = await _repositoryInstructor.create(params.instructor);
    return result;
  }
}

class CreateInstructorParams {
  final Instructor instructor;

  CreateInstructorParams({
    required this.instructor,
  });
}
