import 'package:br_ipti_tag_app/app/api/instructor/get_instructor_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/teacher/data/models/instructor_model.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';

class TeacherRemoteDataSource {
  TeacherRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<InstructorModel>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetInstructorEndPoint(),
    );

    final mappedList = response.data!
        .map(
          (e) => InstructorModel.fromMap(e),
        )
        .toList();

    return mappedList;
  }

  Future<InstructorModel> getById(int id) async {
    final response = await _httpClient.request(
      route: GetInstructorEndPoint(id: id.toString()),
    );

    return InstructorModel.fromMap(response.data!);
  }

  Future<bool> create(Teacher student) async {
    throw UnimplementedError();
  }
}
