import 'package:tag_network/tag_network.dart';

class GetEdcensoUfEndPoint extends EndPointAPI {
  GetEdcensoUfEndPoint({
    this.id,
  });

  final String? id;

  @override
  String get path => id == null ? '/edcensoUf' : '/edcensoUf/{$id}';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
