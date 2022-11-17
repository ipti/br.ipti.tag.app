import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/data/models/student_docs_model.dart';

class PutStudentDocsEndPoint extends EndPointAPI {
  PutStudentDocsEndPoint({
    required this.id,
    required this.model,
  });

  final StudentDocumentsAddressModel model;
  final int id;

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
