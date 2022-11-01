import 'package:tag_sdk/src/core/defaults/params.dart';

abstract class PaginatedParams extends EmptyParams {
  final String? perPage;
  final String? page;

  PaginatedParams({this.perPage = '20', this.page = '1'});
}
