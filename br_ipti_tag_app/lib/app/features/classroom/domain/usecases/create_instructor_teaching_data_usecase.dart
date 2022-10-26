import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

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
