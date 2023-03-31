import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class AddDocumentsAndAddressToStudentUsecase
    implements
        Usecase<StudentDocsAndAddress, AddDocumentsAndAddressToStudentParams> {
  AddDocumentsAndAddressToStudentUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Failure, StudentDocsAndAddress>> call(
    AddDocumentsAndAddressToStudentParams params,
  ) async {
    final result = await _documentsAddressRepository.create(
      params.studentDocumentsAddress,
    );

    return result;
  }
}

class AddDocumentsAndAddressToStudentParams {
  final StudentDocsAndAddress studentDocumentsAddress;
  AddDocumentsAndAddressToStudentParams({
    required this.studentDocumentsAddress,
  });
}
