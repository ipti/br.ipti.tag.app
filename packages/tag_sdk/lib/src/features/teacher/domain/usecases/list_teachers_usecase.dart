import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';

class ListInstructorsUsecase implements Usecase<List<Instructor>, EmptyParams> {
  ListInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Failure, List<Instructor>>> call(EmptyParams params) async {
    final result = await _repositoryInstructor.listAll();

    return result;
  }
}
