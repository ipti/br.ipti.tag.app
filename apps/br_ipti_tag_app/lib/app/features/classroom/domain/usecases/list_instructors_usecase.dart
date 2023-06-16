import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListInstructorsUseCase implements Usecase<List<Instructor>, EmptyParams> {
  final InstructorRepository _repositoryInstructor;
  ListInstructorsUseCase(this._repositoryInstructor);
  @override
  Future<Either<Failure, List<Instructor>>> call(EmptyParams param) async {
    return _repositoryInstructor.listAll();
  }
}
