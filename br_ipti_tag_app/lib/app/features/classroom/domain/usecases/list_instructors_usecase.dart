import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ListInstructorsUseCase
    implements Usecase<List<InstructorEntity>, ListInstructorsParams> {
  final ClassroomRepository _repositoryClassroom;
  ListInstructorsUseCase(this._repositoryClassroom);
  @override
  Future<Either<Exception, List<InstructorEntity>>> call(
      ListInstructorsParams param) async {
    return _repositoryClassroom.listInstructors(param: param);
  }
}

class ListInstructorsParams extends Equatable {
  String schoolId;
  String perPage;
  String page;

  ListInstructorsParams(
      {required this.schoolId, this.page = "1", this.perPage = " 10"});

  Map<String, dynamic> toJson() =>
      <String, dynamic>{"page": page, "perPage": perPage, "school": schoolId};

  @override
  // TODO: implement props
  List<Object?> get props => [schoolId, page, perPage];
}
