import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_doc_address_repositories.dart';

class UpdateDocumentsAndAddressUsecase
    implements Usecase<StudentDocsAndAddress, UpdateDocumentsAndAddressParams> {
  UpdateDocumentsAndAddressUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Failure, StudentDocsAndAddress>> call(
    UpdateDocumentsAndAddressParams params,
  ) async {
    final result = await _documentsAddressRepository.update(
      params.studentDocsId,
      params.studentDocumentsAndAddress,
    );

    return result;
  }
}

class UpdateDocumentsAndAddressParams {
  final StudentDocsAndAddress studentDocumentsAndAddress;
  final int studentDocsId;

  UpdateDocumentsAndAddressParams({
    required this.studentDocsId,
    required this.studentDocumentsAndAddress,
  });
}