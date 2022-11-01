import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/api/classroom/get_edcenso_disciplines_endpoint.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/models/edcenso_discipline.dart';

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
