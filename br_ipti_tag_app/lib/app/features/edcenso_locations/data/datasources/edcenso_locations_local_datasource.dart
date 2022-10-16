import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/models/edcenso_city_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EdcensoLocationsLocalDatasource {
  EdcensoLocationsLocalDatasource();

  Future<List<EdCensoCityModel>> listCities([String? edcensoUfId]) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final stringJson = _sharedPreferences.getStringList("EDCENSO_CITIES");

    if (stringJson != null) {
      final mappedList = stringJson
          .map(
            (e) => EdCensoCityModel.fromJson(e),
          )
          .toList();

      if (edcensoUfId != null) {
        return mappedList
            .where((element) => element.edcensoUfId == edcensoUfId)
            .toList();
      }

      return mappedList;
    }

    return [];
  }

  Future<List<EdCensoCityModel>> storeCities(
    List<EdCensoCityModel> cities,
  ) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final encodedJson = cities
        .map(
          (e) => e.toJson(),
        )
        .toList();

    await _sharedPreferences.setStringList("EDCENSO_CITIES", encodedJson);

    return cities;
  }
}
