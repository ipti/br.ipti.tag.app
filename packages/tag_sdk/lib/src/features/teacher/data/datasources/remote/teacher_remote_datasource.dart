import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/instructor/get_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/post_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/put_instructor_endpoint.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';

class TeacherRemoteDataSource {
  TeacherRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<Instructor>> listAll() async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetInstructorEndPoint(),
    );

    final responseData = response.data?.data ?? [];

    final mappedList = responseData.map(
      (e) => Instructor.fromJson(e),
    );

    return mappedList.toList();
  }

  Future<Instructor> getById(int id) async {
    final response = await _httpClient.request(
      route: GetInstructorEndPoint(id: id),
    );

    return Instructor.fromJson(response.data!);
  }

  Future<Instructor> create(Instructor instructor) async {
    final response = await _httpClient.request(
      route: PostInstructorEndPoint(model: instructor),
    );

    final mappedValue = Instructor.fromJson(response.data!);

    return mappedValue;
  }

  Future<Instructor> update(int id, Instructor instructor) async {
    final response = await _httpClient.request(
      route: PutInstructorEndPoint(objectId: id, model: instructor),
    );

    final mappedValue = Instructor.fromJson(response.data!);

    return mappedValue;
  }
}
