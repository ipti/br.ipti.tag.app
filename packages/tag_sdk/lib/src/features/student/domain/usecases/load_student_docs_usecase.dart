import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_doc_address_repositories.dart';

class LoadStudentDocsUsecase
    implements Usecase<StudentDocsAddress, LoadStudentDocsParams> {
  LoadStudentDocsUsecase(this._repositoryStudentDocs);

  final StudentDocumentsAddressRepository _repositoryStudentDocs;

  @override
  Future<Either<Failure, StudentDocsAddress>> call(
    LoadStudentDocsParams params,
  ) async {
    final result = await _repositoryStudentDocs.getByStudentId(
      params.studentId,
    );

    return result;
  }
}

class LoadStudentDocsParams {
  final int studentId;
  final String schoolId;

  LoadStudentDocsParams(this.studentId, this.schoolId);
}
