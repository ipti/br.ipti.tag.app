import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_docs_model.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/mappers/student_api_to_entity.dart';
import 'package:dartz/dartz.dart';

class StudentDocumentsAddressRepositoryImpl
    implements StudentDocumentsAddressRepository {
  StudentDocumentsAddressRepositoryImpl(
    this._addressRemoteDataSource,
    this._apiToEntity,
  );

  final StudentDocumentsAndAddressRemoteDataSource _addressRemoteDataSource;
  final StudentApiToEntityMapper _apiToEntity;

  @override
  Future<Either<Exception, StudentDocuments>> getById(int id) async {
    try {
      final result = await _addressRemoteDataSource.getById(id);
      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, StudentDocuments>> create(
      StudentDocuments studentDocuments) async {
    try {
      final result = await _addressRemoteDataSource.create(
        studentDocuments as StudentDocumentsAddressModel,
      );
      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudante"));
    }
  }

  @override
  Future<Either<Exception, StudentDocuments>> update(
      String id, StudentDocuments student) async {
    try {
      final result = await _addressRemoteDataSource.update(
          id, student as StudentDocumentsAddressModel);

      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível alterar estudante"));
    }
  }
}
