import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/student_docs/get_student_docs_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_docs/post_student_docs_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_docs/put_student_docs_endpoint.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';

class StudentDocumentsAndAddressRemoteDataSource {
  StudentDocumentsAndAddressRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<StudentDocsAndAddress>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetStudentDocsEndPoint(),
    );

    final mappedList = response.data!
        .map(
          (e) => StudentDocsAndAddress.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }

  Future<StudentDocsAndAddress> getByStudentId(int studentId) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentDocsEndPoint(studentId: studentId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) => StudentDocsAndAddress.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList.first;
  }

  Future<StudentDocsAndAddress> create(
    StudentDocsAndAddress model,
  ) async {
    final response = await _httpClient.request(
      route: PostStudentDocsEndPoint(model: model),
    );

    final mappedValue = StudentDocsAndAddress.fromJson(response.data!);

    return mappedValue;
  }

  Future<StudentDocsAndAddress> update(
    int id,
    StudentDocsAndAddress model,
  ) async {
    final response = await _httpClient.request(
      route: PutStudentDocsEndPoint(id: id, model: model),
    );

    final mappedValue = StudentDocsAndAddress.fromJson(response.data!);

    return mappedValue;
  }
}
