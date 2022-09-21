import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStudentDocumentsAndAddressRemoteDataSource extends Mock 
implements StudentDocumentsAndAddressRemoteDataSource {}

void main() {
  final studentDocsAddress = StudentDocsAddress(
      schoolInepIdFk: "schoolInepIdFk",
      studentFk: "studentFk",
      rgNumber: "rgNumber",
      edcensoUfFk: "edcensoUfFk",
      edcensoCityFk: "edcensoCityFk");
  testWidgets("when StudentDocumentsAddressRepository has right value",
      (tester) async {
    final repository = MockStudentDocumentsAndAddressRemoteDataSource();
    when(() => repository.getByStudentId(''))
        .thenThrow((invocation) => Exception('Houve um problema'));
    
  
    final params = studentDocsAddress;

    expect(params, isA<StudentDocsAddress>());
  });
}
