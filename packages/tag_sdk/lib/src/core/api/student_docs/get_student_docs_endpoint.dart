import 'package:tag_network/tag_network.dart';

class GetStudentDocsEndPoint extends EndPointAPI {
  GetStudentDocsEndPoint({
    this.id,
    this.studentId,
  });

  final String? id;
  final int? studentId;

  @override
  String get path => id == null
      ? '/student-docs-and-address'
      : '/student-docs-and-address/$id';

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
          params.addEntries([MapEntry("student_inep_id", studentId)]);
        }

        return params;
      };
}
