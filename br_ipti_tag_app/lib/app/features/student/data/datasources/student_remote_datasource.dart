import 'package:br_ipti_tag_app/app/api/students/get_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/students/post_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/students/put_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';

class StudentRemoteDataSource {
  StudentRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<StudentModel>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetStudentsEndPoint(),
    );

    final mappedList = response.data!
        .map((e) => StudentModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }

  Future<StudentModel> getById(int id) async {
    final response = await _httpClient.request(
      route: GetStudentsEndPoint(id: id.toString()),
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

  Future<StudentModel> update(String id, StudentModel model) async {
    final response = await _httpClient.request(
      route: PutStudentsEndPoint(id: id, model: model),
    );

    final mappedValue = StudentModel.fromMap(response.data!);

    return mappedValue;
  }
}
