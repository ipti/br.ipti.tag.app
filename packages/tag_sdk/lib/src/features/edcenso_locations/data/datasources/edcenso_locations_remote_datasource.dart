import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/api/edcenso_city/get_edcenso_city_endpoint.dart';
import 'package:tag_sdk/src/api/edcenso_city/get_edcenso_uf_endpoint.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/edcenso_city_model.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/edcenso_uf_models.dart';

class EdcensoLocationsRemoteDatasource {
  final RouterAPI _httpClient;

  EdcensoLocationsRemoteDatasource(this._httpClient);

  Future<List<EdCensoCityModel>> listCities() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoCityEndPoint(),
    );

    final mappedList = response.data!
        .map(
          (e) => EdCensoCityModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }

  Future<List<EdCensoUfModel>> listUFs() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoUfEndPoint(),
    );

    final mappedList = response.data!
        .map(
          (e) => EdCensoUfModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList;
  }
}
