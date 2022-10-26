import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:dartz/dartz.dart';

abstract class StudentDocumentsAddressRepository {
  Future<Either<Exception, StudentDocsAddress>> getByStudentId(
    int id,
  );
  Future<Either<Exception, StudentDocsAddress>> create(
    StudentDocsAddress studentdosStudentDocuments,
  );
  Future<Either<Exception, StudentDocsAddress>> update(
    String id,
    StudentDocsAddress student,
  );
}
