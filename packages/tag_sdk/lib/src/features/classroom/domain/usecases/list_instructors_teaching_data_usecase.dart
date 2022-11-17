import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

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

class ListInstructorsTeachingDataParams {
  final int classroomId;
  final String perPage;
  final String page;
  const ListInstructorsTeachingDataParams({
    required this.classroomId,
    this.page = "1",
    this.perPage = '100',
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "page": page,
        "perPage": perPage,
        "classroomId": classroomId,
      };
}
