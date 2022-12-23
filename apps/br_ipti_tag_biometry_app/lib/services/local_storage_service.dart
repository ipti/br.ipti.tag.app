import 'dart:convert';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_sdk/tag_sdk.dart';

const KEY_SESSION_USER = 'SESSION_USER';

class LocalStorageService {
  Future<StudentIdentification> findStudent(biometricId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localData = sharedPreferences.getStringList("STORAGE_STUDENTS_BIO") ?? [];
  
    //log(localData.toString());
   // log(localData.toString());
    //log(localData!.first.toString());
      final studentBiomtrics = localData.map(StudentBiometrics.fromJson).toList().firstWhere((e) => e.biometricId == biometricId);
       log(studentBiomtrics.student.toString());
       return studentBiomtrics.student;
  }

  Future<int> IdStore() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final localData =
        sharedPreferences.getStringList("STORAGE_STUDENTS_BIO") ?? [];

    var list = List<int>.generate(150, (i) => i + 1);
    log(localData.length.toString());
    // if (localData != null) {
    //   final occupedIndex = localData
    //       .map(StudentBiometrics.fromJson)
    //       .map((e) => e.biometricId)
    //       .toList();

    //   final index = list.firstWhere(
    //     (element) => !occupedIndex.contains(element),
    //   );
    //   log(index.toString());
    return localData.length;
  }

  Future<void> addStudentWithBiometricId(
      {required StudentIdentification student}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localData =
        sharedPreferences.getStringList("STORAGE_STUDENTS_BIO") ?? [];

    
    final studentBio = StudentBiometrics(student, localData.length);

    localData.add(jsonEncode(studentBio.toJson()));

    await sharedPreferences.setStringList(
      "STORAGE_STUDENTS_BIO",
      localData,
    );
  }
}

class StudentBiometrics {
  final StudentIdentification student;
  final int biometricId;

  Map <String, dynamic> toJson() {
    return {
      "student": student.toJson(),
      "biometricId": biometricId,
    };
  }

  factory StudentBiometrics.fromJson(String plainJson) {
    final jsonMap = jsonDecode(plainJson);
    return StudentBiometrics(StudentIdentification.fromJson(jsonMap["student"]),
        jsonMap["biometricId"]);
  }

  StudentBiometrics(this.student, this.biometricId);
}
