import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/edcenso_city_model.dart';

class EdcensoLocationsLocalDatasource {
  EdcensoLocationsLocalDatasource();

  Future<List<EdCensoCityModel>> listCities([int? edcensoUfId]) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final stringJson = sharedPreferences.getStringList("EDCENSO_CITIES");

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
    final sharedPreferences = await SharedPreferences.getInstance();

    final encodedJson = cities
        .map(
          (e) => e.toJson(),
        )
        .toList();

    await sharedPreferences.setStringList("EDCENSO_CITIES", encodedJson);

    return cities;
  }
}
