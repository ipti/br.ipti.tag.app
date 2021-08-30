import 'package:br_ipti_tag_app/app/features/enrollment/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/enrollment/domain/repositories/student_repositories.dart';
import 'package:dio/dio.dart';

class StudentRepository implements IStudentRepository {
  StudentRepository(this.httpClient);

  String Function(String) get _baseUrl => (String localUrl) => "/$localUrl";

  final Dio httpClient;

  @override
  Future<List<Student>> listAll() async {
    final response = await httpClient.get<List<Student>>(_baseUrl(""));
    return Future.value(response.data);
  }

  @override
  Future<Student> getById(int id) async {
    final response = await httpClient.get<Student>(_baseUrl("$id"));
    return Future.value(response.data);
  }

  @override
  Future<bool> create(Student student) async {
    final response = await httpClient.post<bool>(_baseUrl(""), data: student);
    return Future.value(response.data);
  }
}
