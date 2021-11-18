import 'package:br_ipti_tag_app/app/api/students/get_students_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/mappers/student_json_to_response.dart';

class StudentRemoteDataSource {
  StudentRemoteDataSource(
    this._httpClient,
    this._mapperJsonToResponse,
  );

  final RouterAPI _httpClient;
  final StudentJsonToMapMapper _mapperJsonToResponse;

  Future<List<StudentModel>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetStudentsEndPoint(),
    );

    final mappedList = response.data!
        .map((e) => _mapperJsonToResponse(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }

  Future<StudentModel> getById(int id) async {
    final response = await _httpClient.request(
      route: GetStudentsEndPoint(id: id.toString()),
    );

    final mappedValue = _mapperJsonToResponse(response.data!);

    return mappedValue;
  }

  Future<bool> create(Student student) async {
    return false;
  }
}
