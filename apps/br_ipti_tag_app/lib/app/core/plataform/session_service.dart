import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/tag_sdk.dart';

const KEY_SESSION_TOKEN = 'SESSION_TOKEN';
const KEY_SESSION_SCHOOL_YEAR = 'SESSION_SCHOOL_YEAR';
const keySessionUser = 'SESSION_USER';
const keySessionUser_SCHOOLS = 'SESSION_USER_SCHOOLS';
const KEY_SESSION_CURRENT_SCHOOL = 'SESSION_CURRENT_SCHOOL';

abstract class SessionService {
  Future<UserModel> getCurrentUser();
  Future<bool> setCurrentUser(UserModel user);

  Future<String> getToken();
  Future<bool> setToken(String token);
  Future<bool> cleanToken();

  Future<List<AuthSchool>> getCurrentUserSchools();
  Future<bool> setCurrentUserSchools(List<AuthSchool> schools);
  Future<bool> cleanCurrentUserSchools();

  Future<String> getSchoolYear();
  Future<bool> setSchoolYear(String year);
  Future<bool> cleanSchoolYear();

  Future<AuthSchool> getCurrentSchool();
  Future<bool> setCurrentSchool(AuthSchool school);
  Future<bool> cleanCurrentSchool();
}

class SessionServiceImpl extends SessionService {
  @override
  Future<UserModel> getCurrentUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final userJsonString = sharedPreferences.getString(
      keySessionUser,
    );

    if (userJsonString == null) throw Exception("Usuário não está logado");

    final result = UserModel.fromJson(userJsonString);

    return result;
  }

  @override
  Future<bool> setCurrentUser(UserModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final userJson = user.toJson();

    final result = sharedPreferences.setString(
      keySessionUser,
      userJson,
    );

    return result;
  }

  @override
  Future<List<AuthSchool>> getCurrentUserSchools() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final schoolsJsonString = sharedPreferences.getStringList(
      keySessionUser_SCHOOLS,
    );

    if (schoolsJsonString == null) throw Exception("Não há escolas dispoíveis");

    final result =
        schoolsJsonString.map((e) => AuthSchool.fromJson(jsonDecode(e)));

    return result.toList();
  }

  @override
  Future<bool> setCurrentUserSchools(List<AuthSchool> schools) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final mappedSchools = schools.map((x) => jsonEncode(x));

    final result = sharedPreferences.setStringList(
      keySessionUser_SCHOOLS,
      mappedSchools.toList(),
    );

    return result;
  }

  @override
  Future<String> getSchoolYear() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final schoolYearString = sharedPreferences.getString(
      KEY_SESSION_SCHOOL_YEAR,
    );

    if (schoolYearString == null) {
      throw Exception("Não há ano escolar dispoível");
    }

    return schoolYearString;
  }

  @override
  Future<bool> setSchoolYear(String year) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.setString(
      KEY_SESSION_SCHOOL_YEAR,
      year,
    );

    return result;
  }

  @override
  Future<String> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final schoolYearString = sharedPreferences.getString(
      KEY_SESSION_TOKEN,
    );

    if (schoolYearString == null) {
      throw Exception("Não há TOKEN disponível");
    }

    return schoolYearString;
  }

  @override
  Future<bool> setToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.setString(
      KEY_SESSION_TOKEN,
      token,
    );

    return result;
  }

  @override
  Future<bool> cleanCurrentUserSchools() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.remove(keySessionUser_SCHOOLS);

    return result;
  }

  @override
  Future<bool> cleanSchoolYear() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.remove(KEY_SESSION_SCHOOL_YEAR);

    return result;
  }

  @override
  Future<bool> cleanToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.remove(KEY_SESSION_TOKEN);

    return result;
  }

  @override
  Future<bool> cleanCurrentSchool() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.remove(KEY_SESSION_CURRENT_SCHOOL);

    return result;
  }

  @override
  Future<AuthSchool> getCurrentSchool() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.getString(KEY_SESSION_CURRENT_SCHOOL);

    if (result != null) {
      final school = AuthSchool.fromJson(jsonDecode(result));

      return school;
    }

    final schools = await getCurrentUserSchools();

    if (schools.isNotEmpty) return schools.first;

    throw Exception("Nenhuma escola disponível");
  }

  @override
  Future<bool> setCurrentSchool(AuthSchool school) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.setString(
      KEY_SESSION_CURRENT_SCHOOL,
      jsonEncode(school.toJson()),
    );

    return result;
  }
}
