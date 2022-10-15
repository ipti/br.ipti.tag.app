import 'package:br_ipti_tag_app/app/api/student_enrollment/get_student_enrollment_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/student_enrollment/post_student_enrollment_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/student_enrollment/put_student_enrollment_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_enrollment_model.dart';

class StudentEnrollmenrRemoteDataSource {
  StudentEnrollmenrRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  Future<StudentEnrollmentModel> getById(int id) async {
    final response = await _httpClient.request(
      route: GetStudentEnrollmentEndPoint(id: id),
    );

    final mappedValue = StudentEnrollmentModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<StudentEnrollmentModel> getByStudentId(int studentId) async {
    final response = await _httpClient.requestListPaginatedFrom(
      route: GetStudentEnrollmentEndPoint(studentId: studentId),
    );

    final data = response.data?.data ?? [];

    final mappedList = data
        .map((e) => StudentEnrollmentModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return mappedList.first;
  }

  Future<StudentEnrollmentModel> create(StudentEnrollmentModel model) async {
    final response = await _httpClient.request(
      route: PostStudentEnrollmentEndPoint(model: model),
    );

    final mappedValue = StudentEnrollmentModel.fromMap(response.data!);

    return mappedValue;
  }

  Future<StudentEnrollmentModel> update(
    String id,
    StudentEnrollmentModel model,
  ) async {
    final response = await _httpClient.request(
        route: PutStudentEnrollmentEndPoint(
      id: id,
      model: model,
    ));

    final mappedValue = StudentEnrollmentModel.fromMap(response.data!);

    return mappedValue;
  }
}
