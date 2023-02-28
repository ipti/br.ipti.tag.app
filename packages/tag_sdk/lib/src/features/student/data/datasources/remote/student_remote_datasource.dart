import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/students/delete_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/get_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/post_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/put_students_endpoint.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

class StudentRemoteDataSource {
  StudentRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<StudentIdentification>> listAll(
      {required String schoolId}) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentsEndPoint(schoolId: schoolId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) => StudentIdentification.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }

  Future<StudentIdentification> getById(int id,
      {required String schoolId}) async {
    final response = await _httpClient.request(
      route: GetStudentsEndPoint(id: id, schoolId: schoolId),
    );

    final mappedValue = StudentIdentification.fromJson(response.data!);

    return mappedValue;
  }

  Future<StudentIdentification> create(StudentIdentification model) async {
    final response = await _httpClient.request(
      route: PostStudentsEndPoint(model: model),
    );

    final mappedValue = StudentIdentification.fromJson(response.data!);

    return mappedValue;
  }

  Future<StudentIdentification> update(
      int id, StudentIdentification model) async {
    final response = await _httpClient.request(
      route: PutStudentsEndPoint(id: id, model: model),
    );

    final mappedValue = StudentIdentification.fromJson(response.data!);

    return mappedValue;
  }

  Future<bool> delete(int id) async {
    final response = await _httpClient.request(
      route: DeleteStudentsEndPoint(id: id),
    );

    return response.response?.statusCode == 200;
  }
}
