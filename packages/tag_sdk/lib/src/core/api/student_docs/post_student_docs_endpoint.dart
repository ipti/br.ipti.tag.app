import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/tag_sdk.dart';

class PostStudentDocsEndPoint extends EndPointAPI {
  PostStudentDocsEndPoint({
    required this.model,
  });

  final StudentDocsAndAddress model;

  @override
  String get path => '/student-docs-and-address';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
