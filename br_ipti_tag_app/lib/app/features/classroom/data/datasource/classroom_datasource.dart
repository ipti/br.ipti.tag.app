import 'package:br_ipti_tag_app/app/api/classroom/post_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';

class ClassroomRemoteDataSource {
  ClassroomRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<bool> create(PostClassroomParams params) async {
    final response = await _httpClient.request(
      route: PostClasroomEndPoint(params),
    );

    if (response.data != null) {
      return true;
    }

    throw response.error ?? "Erro desconhecido";
  }
}
