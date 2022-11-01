import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/data/models/student_docs_model.dart';

class PostStudentDocsEndPoint extends EndPointAPI {
  PostStudentDocsEndPoint({
    required this.model,
  });

  final StudentDocumentsAddressModel model;

  @override
  String get path => '/student-docs-and-address';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
