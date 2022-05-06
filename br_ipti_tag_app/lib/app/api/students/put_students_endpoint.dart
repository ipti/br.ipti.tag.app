import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';

class PutStudentsEndPoint extends EndPointAPI {
  PutStudentsEndPoint({
    required this.id,
    required this.model,
  });

  final String id;
  final StudentModel model;

  @override
  String get path => '/students/$id';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
