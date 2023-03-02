import 'package:tag_network/tag_network.dart';

class DeleteStudentsEndPoint extends EndPointAPI {
  DeleteStudentsEndPoint({
    required this.id,
  });

  final int id;

  @override
  String get path => '/student-identification/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.DELETE;

  @override
  Parameters? get urlParameters => null;
}
