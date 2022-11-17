import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';

class GetInstructorsUsecase
    implements Usecase<Instructor, GetInstructorParams> {
  GetInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Failure, Instructor>> call(GetInstructorParams params) async {
    final result = await _repositoryInstructor.getById(params.instructorId);

    return result;
  }
}

class GetInstructorParams {
  final int instructorId;

  GetInstructorParams(this.instructorId);
}
