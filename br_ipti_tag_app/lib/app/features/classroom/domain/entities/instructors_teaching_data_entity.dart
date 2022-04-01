class InstructorTeachingDataEntity {
  final String instructorId;
  final String disciplineId;
  final String instructorFk;
  final int role;
  final int contractType;
  InstructorTeachingDataEntity(
      {required this.instructorId,
      required this.disciplineId,
      required this.instructorFk,
      required this.contractType,
      required this.role});
}
