import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateInstructorTeachingDataUseCase
    extends Usecase<bool, UpdateInstructorTeachingDataParams> {
  final ClassroomRepository _classroomRepository;
  UpdateInstructorTeachingDataUseCase(this._classroomRepository);
  @override
  Future<Either<Exception, bool>> call(
      UpdateInstructorTeachingDataParams params) async {
    return _classroomRepository.updateInstructorTeachingData(
        id: params.id, instructor: params.instructor);
  }
}

class UpdateInstructorTeachingDataParams extends Equatable {
  final String id;
  final InstructorTeachingDataUpdateEntity instructor;
  const UpdateInstructorTeachingDataParams(this.id, this.instructor);
  @override
  // TODO: implement props
  List<Object?> get props => [id, instructor];
}
