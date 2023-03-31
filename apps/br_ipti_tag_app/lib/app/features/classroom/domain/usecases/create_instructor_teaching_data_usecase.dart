import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class CreateInstructorTeachingDataUseCase
    implements Usecase<bool, InstructorTeachingDataCreateEntity> {
  final ClassroomRepository _classroomRepository;
  CreateInstructorTeachingDataUseCase(this._classroomRepository);
  @override
  Future<Either<Failure, bool>> call(
    InstructorTeachingDataCreateEntity param,
  ) async {
    return _classroomRepository.createInstructorTeachingData(param);
  }
}
