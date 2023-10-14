import 'package:tag_network/tag_network.dart';

class GetInstructorEndPoint extends EndPointAPI {
  GetInstructorEndPoint({
    this.id,
  });

  final int? id;

  @override
  String get path => id == null ? '/direct/instructor' : '/direct/instructor/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => () => <String, dynamic>{
        "page": 0,
        "perPage": 10,
      };
}
