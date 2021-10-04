class Classroom {
  Classroom({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stageId,
    this.typePedagogicMediationId,
  });

  final String name;
  final String? startTime;
  final String? endTime;
  final int modalityId;
  final int stageId;
  final int? typePedagogicMediationId;
}
