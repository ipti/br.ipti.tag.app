import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListInstructorsTeachingDataUseCase
    implements
        Usecase<List<InstructorTeachingDataEntity>,
            ListInstructorsTeachingDataParams> {
  final ClassroomRepository _repositoryClassroom;
  ListInstructorsTeachingDataUseCase(this._repositoryClassroom);

  @override
  Future<Either<Failure, List<InstructorTeachingDataEntity>>> call(
    ListInstructorsTeachingDataParams param,
  ) async {
    return _repositoryClassroom.listInstructorsTeachingData(param: param);
  }
}

