import 'package:meta/meta.dart';

class Classroom {
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final int modalityId;
  final int stageId;
  final int typePedagogicMediationId;

  Classroom({
    @required this.name,
    @required this.startTime,
    @required this.endTime,
    @required this.modalityId,
    @required this.stageId,
    this.typePedagogicMediationId,
  });
}
