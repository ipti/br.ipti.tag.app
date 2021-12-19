class ClassroomEntity {
  ClassroomEntity({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stage,
    this.typePedagogicMediationId,
  });

  final String name;
  final String? startTime;
  final String? endTime;
  final int? modalityId;
  final String stage;
  final int? typePedagogicMediationId;
}
