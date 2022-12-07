class EdCensoCity {
  final int id;
  final String? oldId;
  final String name;
  final String? cepInitial;
  final String? cepFinal;
  final String? ddd1;
  final String? ddd2;
  final int? edcensoUfId;

  EdCensoCity({
    required this.id,
    this.oldId,
    required this.name,
    this.cepInitial,
    this.cepFinal,
    this.ddd1,
    this.ddd2,
    this.edcensoUfId,
  });
}
