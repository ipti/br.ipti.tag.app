import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_docs_model.dart';

class PostStudentDocsEndPoint extends EndPointAPI {
  PostStudentDocsEndPoint({
    required this.model,
  });

  final StudentDocumentsAddressModel model;

  @override
  String get path => '/studentDocs';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
