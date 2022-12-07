import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

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
