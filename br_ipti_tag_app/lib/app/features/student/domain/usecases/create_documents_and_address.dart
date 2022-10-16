import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:dartz/dartz.dart';

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
