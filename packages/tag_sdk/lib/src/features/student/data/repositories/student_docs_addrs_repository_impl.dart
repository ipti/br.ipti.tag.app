import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_doc_address_repositories.dart';

class StudentDocumentsAddressRepositoryImpl
    implements StudentDocumentsAddressRepository {
  StudentDocumentsAddressRepositoryImpl(
    this._addressRemoteDataSource,
  );

  final StudentDocumentsAndAddressRemoteDataSource _addressRemoteDataSource;

  @override
  Future<Either<Failure, StudentDocsAndAddress>> getByStudentId(int id) async {
    try {
      final result = await _addressRemoteDataSource.getByStudentId(id);

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Failure, StudentDocsAndAddress>> create(
    StudentDocsAndAddress studentDocuments,
  ) async {
    try {
      final result = await _addressRemoteDataSource.create(
        studentDocuments,
      );

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível adicionar estudante"),
      );
    }
  }

  @override
  Future<Either<Failure, StudentDocsAndAddress>> update(
    int id,
    StudentDocsAndAddress student,
  ) async {
    try {
      final result = await _addressRemoteDataSource.update(
        id,
        student,
      );

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível alterar estudante"),
      );
    }
  }
}
