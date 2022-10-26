import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/edcenso_discipline.dart';

class EdcensoDisciplinesLocalDatasource {
  EdcensoDisciplinesLocalDatasource();

  Future<List<EdcensoDiscipline>> listAll([String? edcensoUfId]) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final stringJson = _sharedPreferences.getStringList("EDCENSO_DISCIPLINES");

    if (stringJson != null) {
      final mappedList = stringJson
          .map(
            (e) => EdcensoDisciplineModel.fromJson(e),
          )
          .toList();

      return mappedList;
    }

    return [];
  }

  Future<List<EdcensoDisciplineModel>> storeDisciplines(
    List<EdcensoDisciplineModel> disciplines,
  ) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final encodedJson = disciplines
        .map(
          (e) => e.toJson(),
        )
        .toList();

    await _sharedPreferences.setStringList("EDCENSO_DISCIPLINES", encodedJson);

    return disciplines;
  }
}
