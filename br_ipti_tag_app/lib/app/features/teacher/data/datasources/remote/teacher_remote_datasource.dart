import 'package:br_ipti_tag_app/app/api/instructor/get_instructor_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/post_instructor_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/teacher/data/models/instructor_model.dart';

class TeacherRemoteDataSource {
  TeacherRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<InstructorModel>> listAll() async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetInstructorEndPoint(),
    );

    final responseData = response.data?.data ?? [];

    final mappedList = responseData.map((e) => InstructorModel.fromMap(e));

    return mappedList.toList();
  }

  Future<InstructorModel> getById(int id) async {
    final response = await _httpClient.request(
      route: GetInstructorEndPoint(id: id.toString()),
    );

    return InstructorModel.fromMap(response.data!);
  }

  Future<InstructorModel> create(InstructorModel instructor) async {
    final response = await _httpClient.request(
      route: PostInstructorEndPoint(model: instructor),
    );

    final mappedValue = InstructorModel.fromMap(response.data!);

    return mappedValue;
  }
}
