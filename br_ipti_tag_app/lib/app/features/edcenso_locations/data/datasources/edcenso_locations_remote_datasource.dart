import 'package:br_ipti_tag_app/app/api/edcenso_city/get_edcenso_city_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/edcenso_city/get_edcenso_uf_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/models/edcenso_city_model.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/models/edcenso_uf_models.dart';

class EdcensoLocationsRemoteDatasource {
  final RouterAPI _httpClient;

  EdcensoLocationsRemoteDatasource(this._httpClient);

  Future<List<EdCensoCityModel>> listCities() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoCityEndPoint(),
    );

    final mappedList = response.data!
        .map((e) => EdCensoCityModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }

  Future<List<EdCensoUfModel>> listUFs() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoUfEndPoint(),
    );

    final mappedList = response.data!
        .map((e) => EdCensoUfModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return mappedList;
  }
}
