import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ListInstructorsTeachingDataUseCase
    implements
        Usecase<List<InstructorTeachingDataEntity>,
            ListInstructorsTeachingDataParams> {
  final ClassroomRepository _repositoryClassroom;
  ListInstructorsTeachingDataUseCase(this._repositoryClassroom);

  @override
  Future<Either<Exception, List<InstructorTeachingDataEntity>>> call(
      ListInstructorsTeachingDataParams param) async {
    return _repositoryClassroom.listInstructorsTeachingData(param: param);
  }
}

class ListInstructorsTeachingDataParams extends Equatable {
  String classroomId;
  String perPage;
  String page;
  ListInstructorsTeachingDataParams(
      {required this.classroomId, this.page = "1", this.perPage = '10'});
  @override
  // TODO: implement props
  List<Object?> get props => [classroomId, perPage, page];

  Map<String, dynamic> toJson() => <String, dynamic>{
        "page": page,
        "perPage": perPage,
        "classroomId": classroomId
      };
}
