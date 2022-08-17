import 'package:br_ipti_tag_app/app/api/classroom/delete_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/classroom/get_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/classroom/get_edcenso_disciplines_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/classroom/post_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/classroom/put_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/create_instructor_teaching_data_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/get_instructors_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/get_instructors_teaching_data_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/instructor/put_instructor_teaching_data_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_create_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/edcenso_discipline_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_create_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_update_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';

class ClassroomRemoteDataSource {
  final RouterAPI _httpClient;

  ClassroomRemoteDataSource(
    this._httpClient,
  );

  Future<bool> create(ClassroomCreateModel classroomModel) async {
    final response = await _httpClient.request(
      route: PostClasroomEndPoint(classroomModel),
    );

    if (response.data != null) {
      return true;
    }

    throw response.error ?? "Erro desconhecido";
  }

  Future<bool> createInstructorsTeachingData(
      InstructorTeachingDataCreateModel instructor) async {
    final response = await _httpClient.request(
      route: PostInstructorTeachingDataEndpoint(instructor),
    );

    return response.data?['_id'] != null;
  }

  Future<bool> delete(
    String id,
  ) async {
    final response = await _httpClient.request(
      route: DeleteClasroomEndPoint(
        id,
      ),
    );

    if (response.data != null) {
      return true;
    }

    throw response.error ?? "Erro desconhecido";
  }

  Future<List<ClassroomModel>> listAll(ClassroomParams params) async {
    final response = await _httpClient.request(
      route: GetClassroomEndPoint(params),
    );

    final mappedList = (response.data!['data'] as List)
        .map((e) => ClassroomModel.fromJson(e))
        .toList();
    return mappedList;
  }

  Future<List<EdcensoDisciplinesEntity>> listEdcensoDisciplines() async {
    final response = await _httpClient.requestListFrom(
      route: GetEdcensoDisciplinesEndpoint(),
    );

    final mappedList =
        response.data!.map((e) => EdcensoDisciplineModel.fromJson(e)).toList();

    return mappedList;
  }

  Future<List<InstructorEntity>> listInstructors() async {
    final response = await _httpClient.request(
      route: GetInstructorsEndPoint(),
    );

    final mappedList = (response.data!['data'] as List)
        .map((e) => InstructorModel.fromJson(e))
        .toList();

    return mappedList;
  }

  Future<List<InstructorTeachingDataEntity>> listInstructorsTeachingData(
      ListInstructorsTeachingDataParams param) async {
    final response = await _httpClient.request(
      route: GetInstructorsTeachingDataEndPoint(param),
    );

    final mappedList = (response.data!['data'] as List)
        .map((e) => InstructorTeachingDataModel.fromJson(e))
        .toList();

    return mappedList;
  }

  Future<bool> update(
    ClassroomCreateModel classroomModel,
    String id,
  ) async {
    final response = await _httpClient.request(
      route: PutClasroomEndPoint(
        classroomModel,
        id,
      ),
    );

    if (response.data != null) {
      return true;
    }

    throw response.error ?? "Erro desconhecido";
  }

  Future<bool> updateInstructorsTeachingData(
      String id, InstructorTeachingDataUpdateModel instructor) async {
    final response = await _httpClient.request(
      route: PutInstructorTeachingDataEndpoint(instructor, id),
    );

    return response.data!['data'] != null;
  }
}
