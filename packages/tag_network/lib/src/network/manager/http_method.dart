enum HTTPMethod { GET, POST, PUT, PATCH, DELETE }

extension InString on HTTPMethod {
  String get name => toString().split('.').last;
}
