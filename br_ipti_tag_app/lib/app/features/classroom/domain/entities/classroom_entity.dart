class ClassroomEntity {
  ClassroomEntity({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stage,
    required this.id,
    this.typePedagogicMediationId,
  });

  final String name;
  final String id;
  final String? startTime;
  final String? endTime;
  final int? modalityId;
  final String stage;
  final int? typePedagogicMediationId;
}
