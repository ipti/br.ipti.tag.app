import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/classroom_repositories.dart';
import 'package:dartz/dartz.dart';

class ListClassroomsUsecase
    implements Usecase<List<Classroom>, ListClassroomsParams> {
  ListClassroomsUsecase(this._repositoryStudent);

  final ClassroomRepository _repositoryStudent;

  @override
  Future<Either<Exception, List<Classroom>>> call(
      ListClassroomsParams params) async {
    final result = await _repositoryStudent.listAll(schoolId: params.schoolId);
    return result;
  }
}

class ListClassroomsParams {
  final String schoolId;

  ListClassroomsParams({required this.schoolId});
}
