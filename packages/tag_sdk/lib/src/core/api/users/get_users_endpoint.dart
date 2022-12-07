import 'package:tag_network/tag_network.dart';

class GetUserEndPoint extends EndPointAPI {
  GetUserEndPoint({this.id});

  final String? id;

  @override
  String get path => id == null ? '/users' : '/users/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
