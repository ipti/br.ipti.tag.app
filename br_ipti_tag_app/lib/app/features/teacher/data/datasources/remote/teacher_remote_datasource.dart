import 'package:br_ipti_tag_app/app/api/instructor/get_instructor_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/instructor_response.dart';

import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';
import 'package:br_ipti_tag_app/app/features/teacher/mappers/teacher_json_to_response.dart';

class TeacherRemoteDataSource {
  TeacherRemoteDataSource(
    this._httpClient,
    this._mapperJsonToResponse,
  );

  final RouterAPI _httpClient;
  final TeacherJsonToMapMapper _mapperJsonToResponse;

  Future<List<InstructorResponse>> listAll() async {
    final response = await _httpClient.requestListOf(
      route: GetInstructorEndPoint(),
    );

    final mappedList = response.data!
        .map((e) => _mapperJsonToResponse(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }

  Future<InstructorResponse> getById(int id) async {
    final response = await _httpClient.request(
      route: GetInstructorEndPoint(id: id.toString()),
    );

    final mappedValue = _mapperJsonToResponse(response.data!);

    return mappedValue;
  }

  Future<bool> create(Teacher student) async {
    throw UnimplementedError();
  }
}
