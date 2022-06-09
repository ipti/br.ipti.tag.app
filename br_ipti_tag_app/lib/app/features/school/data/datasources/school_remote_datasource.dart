import 'package:br_ipti_tag_app/app/api/school/dto/school_update.dto.dart';
import 'package:br_ipti_tag_app/app/api/school/get_school_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/school/put_school_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/data/data_source.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';

class SchoolRemoteDataSource implements DataSource<SchoolEntity, SchoolModel> {
  SchoolRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  @override
  Future<SchoolModel> create(SchoolEntity data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<SchoolModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> getOne(String uuid) async {
    final response = await _httpClient.request(
      route: GetSchoolEndPoint(uuid),
    );

    final data = SchoolModel.fromMap(response.data!);
    return data;
  }

  @override
  Future<SchoolModel> update(String uuid, SchoolEntity data) async {
    final response = await _httpClient.request(
      route: PutSchoolEndPoint(uuid, data as SchoolUpdateDto),
    );
    return response as SchoolModel;
  }

  @override
  Future<bool> delete(String uuid) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
