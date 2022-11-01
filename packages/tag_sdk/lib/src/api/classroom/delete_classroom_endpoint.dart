import 'package:tag_network/tag_network.dart';

class DeleteClasroomEndPoint extends EndPointAPI {
  DeleteClasroomEndPoint(
    this.id,
  );

  String id;

  @override
  String get path => '/classroom/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.DELETE;

  @override
  Parameters? get urlParameters => null;
}
