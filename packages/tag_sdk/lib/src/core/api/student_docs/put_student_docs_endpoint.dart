import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';

class PutStudentDocsEndPoint extends EndPointAPI {
  PutStudentDocsEndPoint({
    required this.id,
    required this.model,
  });

  final StudentDocsAndAddress model;
  final int id;

  @override
  String get path => '/student-docs-and-address/$id';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
