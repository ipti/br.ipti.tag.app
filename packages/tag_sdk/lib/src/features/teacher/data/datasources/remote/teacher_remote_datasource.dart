import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/instructor/get_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/post_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/put_instructor_endpoint.dart';
import 'package:tag_sdk/src/features/teacher/data/models/instructor_model.dart';

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

    final mappedList = responseData.map(
      (e) => InstructorModel.fromMap(e),
    );

    return mappedList.toList();
  }

  Future<InstructorModel> getById(String id) async {
    final response = await _httpClient.request(
      route: GetInstructorEndPoint(id: id),
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

  Future<InstructorModel> update(String id, InstructorModel instructor) async {
    final response = await _httpClient.request(
      route: PutInstructorEndPoint(objectId: id, model: instructor),
    );

    final mappedValue = InstructorModel.fromMap(response.data!);

    return mappedValue;
  }
}
