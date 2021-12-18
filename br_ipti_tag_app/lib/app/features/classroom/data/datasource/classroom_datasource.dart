import 'package:br_ipti_tag_app/app/api/classroom/post_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_create_model.dart';

class ClassroomRemoteDataSource {
  ClassroomRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<bool> create(ClassroomCreateModel classroomModel) async {
    final response = await _httpClient.request(
      route: PostClasroomEndPoint(classroomModel),
    );

    if (response.data != null) {
      return true;
    }

    throw response.error ?? "Erro desconhecido";
  }
}
