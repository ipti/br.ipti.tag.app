import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class UpdateInstructorTeachingDataUseCase
    extends Usecase<bool, UpdateInstructorTeachingDataParams> {
  final ClassroomRepository _classroomRepository;
  UpdateInstructorTeachingDataUseCase(this._classroomRepository);
  @override
  Future<Either<Failure, bool>> call(
    UpdateInstructorTeachingDataParams params,
  ) async {
    return _classroomRepository.updateInstructorTeachingData(
      id: params.id,
      instructor: params.instructor,
    );
  }
}

class UpdateInstructorTeachingDataParams {
  final int id;
  final InstructorTeachingDataUpdateEntity instructor;
  const UpdateInstructorTeachingDataParams(this.id, this.instructor);
}
