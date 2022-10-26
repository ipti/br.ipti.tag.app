import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class PostAuthLoginEndPoint extends EndPointAPI {
  PostAuthLoginEndPoint(this.username, this.password);

  final String username;
  final String password;

  @override
  String get path => '/auth/login';

  @override
  Parameters? get bodyParameters => () => {
        'username': username,
        'password': password,
      };

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
