import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';

class ListInstructorsUseCase implements Usecase<List<Instructor>, EmptyParams> {
  final InstructorRepository _repositoryInstructor;
  ListInstructorsUseCase(this._repositoryInstructor);
  @override
  Future<Either<Failure, List<Instructor>>> call(EmptyParams param) async {
    return _repositoryInstructor.listAll();
  }
}
