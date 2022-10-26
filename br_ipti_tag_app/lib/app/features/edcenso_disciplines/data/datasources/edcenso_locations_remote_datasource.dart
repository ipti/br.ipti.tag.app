import 'package:br_ipti_tag_app/app/core/api/classroom/get_edcenso_disciplines_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/data/models/edcenso_discipline.dart';

class EdcensoDisciplinesRemoteDatasource {
  final RouterAPI _httpClient;

  EdcensoDisciplinesRemoteDatasource(this._httpClient);

  Future<List<EdcensoDisciplineModel>> listAll() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoDisciplinesEndpoint(),
    );

    final mappedList = response.data!
        .map(
          (e) => EdcensoDisciplineModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }
}
