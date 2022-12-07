import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/get_student_enrollment_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/post_student_enrollment_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/put_student_enrollment_endpoint.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

class StudentEnrollmenrRemoteDataSource {
  StudentEnrollmenrRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<StudentEnrollment> getById(int id) async {
    final response = await _httpClient.request(
      route: GetStudentEnrollmentEndPoint(id: id),
    );

    final mappedValue = StudentEnrollment.fromJson(response.data!);

    return mappedValue;
  }

  Future<StudentEnrollment> getByStudentId(int studentId) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentEnrollmentEndPoint(studentId: studentId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map(
          (e) => StudentEnrollment.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return mappedList.first;
  }

  Future<StudentEnrollment> create(StudentEnrollment model) async {
    final response = await _httpClient.request(
      route: PostStudentEnrollmentEndPoint(model: model),
    );

    final mappedValue = StudentEnrollment.fromJson(response.data!);

    return mappedValue;
  }

  Future<StudentEnrollment> update(
    int id,
    StudentEnrollment model,
  ) async {
    final response = await _httpClient.request(
      route: PutStudentEnrollmentEndPoint(
        id: id,
        model: model,
      ),
    );

    final mappedValue = StudentEnrollment.fromJson(response.data!);

    return mappedValue;
  }
}
