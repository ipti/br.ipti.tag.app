import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:dio/dio.dart';

class StudentDataSource {
  StudentDataSource(this.httpClient);

  String Function(String) get _baseUrl => (String localUrl) => "/$localUrl";

  final Dio httpClient;

  Future<List<Student>> listAll() async {
    final response = await httpClient.get<List<Student>>(_baseUrl(""));
    return Future.value(response.data);
  }

  Future<Student> getById(int id) async {
    final response = await httpClient.get<Student>(_baseUrl("$id"));
    return Future.value(response.data);
  }

  Future<bool> create(Student student) async {
    final response = await httpClient.post<bool>(_baseUrl(""), data: student);
    return Future.value(response.data);
  }
}
