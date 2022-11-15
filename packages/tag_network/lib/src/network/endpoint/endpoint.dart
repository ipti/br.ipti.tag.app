import 'package:tag_network/src/network/manager/http_method.dart';

typedef HTTPHeaders = Map<String, dynamic> Function();
typedef Parameters = Map<String, dynamic> Function();

abstract class EndPointAPI {
  String get path;
  HTTPMethod get httpMethod;
  HTTPHeaders? get headers;
  Parameters? get bodyParameters;
  Parameters? get urlParameters;
}
