import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:dartz/dartz.dart';

class AddDocumentsAndAddressToStudentUsecase
    implements
        Usecase<StudentDocuments, AddDocumentsAndAddressToStudentParams> {
  AddDocumentsAndAddressToStudentUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Exception, StudentDocuments>> call(
      AddDocumentsAndAddressToStudentParams params) async {
    final result = await _documentsAddressRepository.create(
      params.studentDocumentsAddress,
    );

    return result;
  }
}

class AddDocumentsAndAddressToStudentParams {
  final StudentDocuments studentDocumentsAddress;
  AddDocumentsAndAddressToStudentParams({
    required this.studentDocumentsAddress,
  });
}
