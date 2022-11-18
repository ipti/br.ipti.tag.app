import 'package:tag_network/tag_network.dart';

class GetStudentEnrollmentEndPoint extends EndPointAPI {
  GetStudentEnrollmentEndPoint({
    this.id,
    this.studentId,
  });

  final int? id;
  final int? studentId;

  @override
  String get path =>
      id == null ? '/student-enrollment' : '/student-enrollment/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => () {
        final params = <String, dynamic>{};
        if (studentId != null) {
          params.addEntries([MapEntry("student", studentId)]);
        }

        return params;
      };
}
