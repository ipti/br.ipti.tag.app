import 'package:tag_network/tag_network.dart';

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
