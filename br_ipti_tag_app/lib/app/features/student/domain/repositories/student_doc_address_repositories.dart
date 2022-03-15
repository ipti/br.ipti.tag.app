import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:dartz/dartz.dart';

abstract class StudentDocumentsAddressRepository {
  Future<Either<Exception, StudentDocuments>> getByStudentId(
    String id,
  );
  Future<Either<Exception, StudentDocuments>> create(
    StudentDocuments studentdosStudentDocuments,
  );
  Future<Either<Exception, StudentDocuments>> update(
    String id,
    StudentDocuments student,
  );
}
