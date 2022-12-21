import 'dart:convert';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/tag_sdk.dart';

const KEY_SESSION_USER = 'SESSION_USER';

class LocalStorageService {
  Future<void> findStudent(biometricId) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO");
    log('opaaa');
    log(localData!.first.toString());
    if (localData != null) {
      // log(localData.toString());

      final student = localData.map(StudentBiometrics.fromJson).map((e) => {
            if (e.biometricId == biometricId) {e.student}
          });
      log(student.toString());
    }
  }

  Future<int> IdStore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO");

    var list = List<int>.generate(150, (i) => i + 1);
    if (localData != null) {
      final occupedIndex = localData
          .map(StudentBiometrics.fromJson)
          .map((e) => e.biometricId)
          .toList();

      final index = list.firstWhere(
        (element) => !occupedIndex.contains(element),
      );
      return index;
    }
    return 0;
  }

  Future<void> addStudentWithBiometricId(
      {required StudentIdentification student}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO");

    if (localData != null) {
      var list = List<int>.generate(150, (i) => i + 1);
      final occupedIndex = localData
          .map(StudentBiometrics.fromJson)
          .map((e) => e.biometricId)
          .toList();

      final index = list.firstWhere(
        (element) => !occupedIndex.contains(element),
      );

      final studentBio = StudentBiometrics(student, index);
      localData.add(studentBio.toJson());

      await sharedPreferences.setStringList(
        "STORAGE_STUDENTS_BIO",
        localData,
      );
    }
  }
}

class StudentBiometrics {
  final StudentIdentification student;
  final int biometricId;

  String toJson() {
    return {
      "student": student.toJson(),
      "biometricId": biometricId,
    }.toString();
  }

  factory StudentBiometrics.fromJson(String plainJson) {
    final jsonMap = jsonDecode(plainJson);
    return StudentBiometrics(StudentIdentification.fromJson(jsonMap["student"]),
        int.parse(jsonMap["biometricId"]));
  }

  StudentBiometrics(this.student, this.biometricId);
}
