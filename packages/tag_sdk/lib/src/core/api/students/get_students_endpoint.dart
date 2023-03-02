import 'package:tag_network/tag_network.dart';

class GetStudentsEndPoint extends EndPointAPI {
  GetStudentsEndPoint({this.id, required this.schoolId});

  final int? id;
  final String schoolId;

  @override
  String get path =>
      id == null ? '/student-identification' : '/student-identification/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => () => {
        // "school": schoolId,
        "perPage": 1000,
      };
}
