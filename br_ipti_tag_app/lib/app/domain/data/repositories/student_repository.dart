import 'package:br_ipti_tag_app/app/domain/data/entities/student.dart';
import 'package:br_ipti_tag_app/app/domain/domain/services/student_service.dart';
import 'package:dio/dio.dart';

class StudentRepository implements IStudentRepository {
  get _baseUrl => (localUrl) => "/$localUrl";

  final Dio httpClient;

  StudentRepository(this.httpClient);

  Future<List<Student>> listAll() async {
    var response = await httpClient.get<List<Student>>(_baseUrl());
    return Future.value(response.data);
  }

  Future<Student> getById(int id) async {
    var response = await httpClient.get<Student>(_baseUrl("$id"));
    return Future.value(response.data);
  }

  @override
  Future<bool> create(Student student) async {
    var response = await httpClient.post<bool>(_baseUrl(), data: student);
    return Future.value(response.data);
  }
}
