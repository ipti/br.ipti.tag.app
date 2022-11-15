import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class CreateInstructorTeachingDataUseCase
    implements Usecase<bool, InstructorTeachingDataCreateEntity> {
  final ClassroomRepository _classroomRepository;
  CreateInstructorTeachingDataUseCase(this._classroomRepository);
  @override
  Future<Either<Exception, bool>> call(
    InstructorTeachingDataCreateEntity param,
  ) async {
    return _classroomRepository.createInstructorTeachingData(param);
  }
}
