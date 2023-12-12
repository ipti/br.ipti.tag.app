import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/tag_sdk.dart';

const keySessionUser = 'SESSION_USER';

class LocalStorageService {
  Future<StudentIdentification> findStudent(biometricId) async {
    print("================findStudent================");
    final sharedPreferences = await SharedPreferences.getInstance();
    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO");

    if (localData != null) {
      final studentBiomtrics =
          localData.map(StudentBiometrics.fromJson).toList().firstWhere((e) => e.biometricId == biometricId);

      return studentBiomtrics.student;
    }
    return StudentIdentification();
  }

  Future<bool> deleteAll() async {
    print("================deleteAll================");
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }

  Future<int> idStore() async {
    print("================idStore================");
    final sharedPreferences = await SharedPreferences.getInstance();

    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO") ?? [];

    log("IDSTORE: ${localData.length}");

    return localData.length;
  }

  Future<void> addStudentWithBiometricId({required StudentIdentification student}) async {
    print("================addStudentWithBiometricId================");

    final sharedPreferences = await SharedPreferences.getInstance();
    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO") ?? [];

    final studentBio = StudentBiometrics(student, localData.length);

    print("STUDENT BIO: ${studentBio.biometricId}");

    localData.add(jsonEncode(studentBio.toJson()));

    await sharedPreferences.setStringList("STORAGE_STUDENTS_BIO", localData);
  }
}

class StudentBiometrics {
  final StudentIdentification student;
  final int biometricId;

  Map<String, dynamic> toJson() {
    return {
      "student": student.toJson(),
      "biometricId": biometricId,
    };
  }

  factory StudentBiometrics.fromJson(String plainJson) {
    final jsonMap = jsonDecode(plainJson);
    return StudentBiometrics(StudentIdentification.fromJson(jsonMap["student"]), jsonMap["biometricId"]);
  }

  StudentBiometrics(this.student, this.biometricId);
}
