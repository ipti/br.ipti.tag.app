import 'package:br_ipti_tag_app/app/api/student_docs/get_student_docs_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/student_docs/post_student_docs_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/student_docs/put_student_docs_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_docs_model.dart';

class StudentDocumentsAndAddressRemoteDataSource {
  StudentDocumentsAndAddressRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<StudentDocumentsAddressModel>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetStudentDocsEndPoint(),
    );

    final mappedList = response.data!
        .map(
          (e) =>
              StudentDocumentsAddressModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }

  Future<StudentDocumentsAddressModel> getByStudentId(int studentId) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentDocsEndPoint(studentId: studentId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) =>
              StudentDocumentsAddressModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList.first;
  }

  Future<StudentDocumentsAddressModel> create(
    StudentDocumentsAddressModel model,
  ) async {
    final response = await _httpClient.request(
      route: PostStudentDocsEndPoint(model: model),
    );

    final mappedValue = StudentDocumentsAddressModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<StudentDocumentsAddressModel> update(
    String id,
    StudentDocumentsAddressModel model,
  ) async {
    final response = await _httpClient.request(
      route: PutStudentDocsEndPoint(id: id, model: model),
    );

    final mappedValue = StudentDocumentsAddressModel.fromMap(response.data!);

    return mappedValue;
  }
}
