import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateClassroomUsecase extends Usecase<bool, ParamsCreateClassroom> {
  CreateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(ParamsCreateClassroom params) async {
    final Classroom classroom = Classroom(
      name: params.name,
      startTime: params.startTime,
      endTime: params.endTime,
      modalityId: params.modalityId,
      stageId: params.stageId,
    );
    return _repositoryClassroom.create(classroom);
  }
}

class ParamsCreateClassroom extends Equatable {
  const ParamsCreateClassroom({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stageId,
  });

  final String name;
  final String startTime;
  final String endTime;
  final int modalityId;
  final int stageId;

  @override
  List<Object> get props {
    return [
      name,
      startTime,
      endTime,
      modalityId,
      stageId,
    ];
  }
}
