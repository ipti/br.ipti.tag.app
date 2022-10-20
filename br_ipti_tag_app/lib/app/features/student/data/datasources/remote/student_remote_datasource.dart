import 'package:br_ipti_tag_app/app/core/api/students/delete_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/api/students/get_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/api/students/post_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/api/students/put_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';

class StudentRemoteDataSource {
  StudentRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<StudentModel>> listAll({required String schoolId}) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentsEndPoint(schoolId: schoolId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) => StudentModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }

  Future<StudentModel> getById(String id, {required String schoolId}) async {
    final response = await _httpClient.request(
      route: GetStudentsEndPoint(id: id, schoolId: schoolId),
    );

    final mappedValue = StudentModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<StudentModel> create(StudentModel model) async {
    final response = await _httpClient.request(
      route: PostStudentsEndPoint(model: model),
    );

    final mappedValue = StudentModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<StudentModel> update(int id, StudentModel model) async {
    final response = await _httpClient.request(
      route: PutStudentsEndPoint(id: id, model: model),
    );

    final mappedValue = StudentModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<bool> delete(String id) async {
    final response = await _httpClient.request(
      route: DeleteStudentsEndPoint(id: id),
    );

    return response.response?.statusCode == 200;
  }
}
