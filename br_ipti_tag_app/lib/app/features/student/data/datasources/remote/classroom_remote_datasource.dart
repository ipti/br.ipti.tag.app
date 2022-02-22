import 'package:br_ipti_tag_app/app/api/classroom/get_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/classroom_model.dart';

class ClassroomRemoteDataSource {
  ClassroomRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<ClassroomModel>> listAll({required String schoolId}) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetClassroomEndPoint(schoolId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map((e) => ClassroomModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }
}
