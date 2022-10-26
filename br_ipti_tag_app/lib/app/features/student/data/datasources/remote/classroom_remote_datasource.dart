import 'package:br_ipti_tag_app/app/core/api/classroom/get_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/classroom_model.dart';

class ClassroomRemoteDataSource {
  ClassroomRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<List<ClassroomModel>> listAll(ClassroomParams params) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetClassroomEndPoint(params),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) => ClassroomModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }
}
