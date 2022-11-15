import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/tag_sdk.dart';

const KEY_SESSION_TOKEN = 'SESSION_TOKEN';
const KEY_SESSION_SCHOOL_YEAR = 'SESSION_SCHOOL_YEAR';
const KEY_SESSION_USER = 'SESSION_USER';
const KEY_SESSION_USER_SCHOOLS = 'SESSION_USER_SCHOOLS';
const KEY_SESSION_CURRENT_SCHOOL = 'SESSION_CURRENT_SCHOOL';

abstract class SessionService {
  Future<User> getCurrentUser();
  Future<bool> setCurrentUser(UserModel user);

  Future<String> getToken();
  Future<bool> setToken(String token);
  Future<bool> cleanToken();

  Future<List<School>> getCurrentUserSchools();
  Future<bool> setCurrentUserSchools(List<School> schools);
  Future<bool> cleanCurrentUserSchools();

  Future<String> getSchoolYear();
  Future<bool> setSchoolYear(String year);
  Future<bool> cleanSchoolYear();

  Future<School> getCurrentSchool();
  Future<bool> setCurrentSchool(School school);
  Future<bool> cleanCurrentSchool();
}

class SessionServiceImpl extends SessionService {
  @override
  Future<User> getCurrentUser() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final userJsonString = _sharedPreferences.getString(
      KEY_SESSION_USER,
    );

    if (userJsonString == null) throw Exception("Não há escolas dispoíveis");

    final result = UserModel.fromJson(userJsonString);

    return result;
  }

  @override
  Future<bool> setCurrentUser(UserModel user) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final userJson = user.toJson();

    final result = _sharedPreferences.setString(
      KEY_SESSION_USER,
      userJson,
    );

    return result;
  }

  @override
  Future<List<School>> getCurrentUserSchools() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final schoolsJsonString = _sharedPreferences.getStringList(
      KEY_SESSION_USER_SCHOOLS,
    );

    if (schoolsJsonString == null) throw Exception("Não há escolas dispoíveis");

    final result = schoolsJsonString.map((e) => SchoolModel.fromJson(e));

    return result.toList();
  }

  @override
  Future<bool> setCurrentUserSchools(List<School> schools) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final mappedSchools = schools.map((x) => (x as SchoolModel).toJson());

    final result = _sharedPreferences.setStringList(
      KEY_SESSION_USER_SCHOOLS,
      mappedSchools.toList(),
    );

    return result;
  }

  @override
  Future<String> getSchoolYear() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final schoolYearString = _sharedPreferences.getString(
      KEY_SESSION_SCHOOL_YEAR,
    );

    if (schoolYearString == null) {
      throw Exception("Não há ano escolar dispoível");
    }

    return schoolYearString;
  }

  @override
  Future<bool> setSchoolYear(String year) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.setString(
      KEY_SESSION_SCHOOL_YEAR,
      year,
    );

    return result;
  }

  @override
  Future<String> getToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final schoolYearString = _sharedPreferences.getString(
      KEY_SESSION_TOKEN,
    );

    if (schoolYearString == null) {
      throw Exception("Não há TOKEN disponível");
    }

    return schoolYearString;
  }

  @override
  Future<bool> setToken(String token) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.setString(
      KEY_SESSION_TOKEN,
      token,
    );

    return result;
  }

  @override
  Future<bool> cleanCurrentUserSchools() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.remove(KEY_SESSION_USER_SCHOOLS);

    return result;
  }

  @override
  Future<bool> cleanSchoolYear() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.remove(KEY_SESSION_SCHOOL_YEAR);

    return result;
  }

  @override
  Future<bool> cleanToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.remove(KEY_SESSION_TOKEN);

    return result;
  }

  @override
  Future<bool> cleanCurrentSchool() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.remove(KEY_SESSION_CURRENT_SCHOOL);

    return result;
  }

  @override
  Future<School> getCurrentSchool() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.getString(KEY_SESSION_CURRENT_SCHOOL);

    if (result != null) {
      final school = SchoolModel.fromJson(result);

      return school;
    }

    final schools = await getCurrentUserSchools();

    if (schools.isNotEmpty) return schools.first;

    throw Exception("Nenhuma escola disponível");
  }

  @override
  Future<bool> setCurrentSchool(School school) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final result = _sharedPreferences.setString(
      KEY_SESSION_CURRENT_SCHOOL,
      (school as SchoolModel).toJson(),
    );

    return result;
  }
}
