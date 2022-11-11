import 'package:tag_network/tag_network.dart';

class GetEdcensoCityEndPoint extends EndPointAPI {
  GetEdcensoCityEndPoint({
    this.id,
  });

  final String? id;

  @override
  String get path => id == null ? '/edcensoCity' : '/edcensoCity/{$id}';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
