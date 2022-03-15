import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:dartz/dartz.dart';

class UpdateDocumentsAndAddressUsecase
    implements Usecase<StudentDocuments, UpdateDocumentsAndAddressParams> {
  UpdateDocumentsAndAddressUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Exception, StudentDocuments>> call(
      UpdateDocumentsAndAddressParams params) async {
    final result = await _documentsAddressRepository.update(
      params.studentDocsId,
      params.studentDocumentsAndAddress.copyWith(rgNumber: "354511254"),
    );

    return result;
  }
}

class UpdateDocumentsAndAddressParams {
  final StudentDocuments studentDocumentsAndAddress;
  final String studentDocsId;

  UpdateDocumentsAndAddressParams({
    required this.studentDocsId,
    required this.studentDocumentsAndAddress,
  });
}
