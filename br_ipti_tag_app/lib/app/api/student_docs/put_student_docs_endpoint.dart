import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_docs_model.dart';

class PutStudentDocsEndPoint extends EndPointAPI {
  PutStudentDocsEndPoint({
    required this.id,
    required this.model,
  });

  final StudentDocumentsAddressModel model;
  final String id;

  @override
  String get path => '/student-docs-and-address/$id';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
