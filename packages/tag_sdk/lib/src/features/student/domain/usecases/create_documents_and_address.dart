import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_doc_address_repositories.dart';

class AddDocumentsAndAddressToStudentUsecase
    implements
        Usecase<StudentDocsAddress, AddDocumentsAndAddressToStudentParams> {
  AddDocumentsAndAddressToStudentUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Exception, StudentDocsAddress>> call(
    AddDocumentsAndAddressToStudentParams params,
  ) async {
    final result = await _documentsAddressRepository.create(
      params.studentDocumentsAddress,
    );

    return result;
  }
}

class AddDocumentsAndAddressToStudentParams {
  final StudentDocsAddress studentDocumentsAddress;
  AddDocumentsAndAddressToStudentParams({
    required this.studentDocumentsAddress,
  });
}
