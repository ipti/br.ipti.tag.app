import 'package:equatable/equatable.dart';

class StockState extends Equatable {
  const StockState({
    this.name,
    this.birthday,
    this.sex,
    this.colorRace,
    this.filiation,
    this.nationality,
    this.deficiency,
    this.residenceZone,
    this.studentClass,
  });

  final String name;
  final String birthday;
  final int sex;
  final int colorRace;
  final int filiation;
  final int nationality;
  final bool deficiency;
  final int residenceZone;
  final int studentClass;

  StockState copyWith({
    String name,
    String birthday,
    int sex,
    int colorRace,
    int filiation,
    int nationality,
    bool deficiency,
    int residenceZone,
    int studentClass,
  }) {
    return StockState(
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      sex: sex ?? this.sex,
      colorRace: colorRace ?? this.colorRace,
      filiation: filiation ?? this.filiation,
      nationality: nationality ?? this.nationality,
      deficiency: deficiency ?? this.deficiency,
      residenceZone: residenceZone ?? this.residenceZone,
      studentClass: studentClass ?? this.studentClass,
    );
  }

  @override
  List<Object> get props => [
        name,
        birthday,
        sex,
        colorRace,
        filiation,
        nationality,
        deficiency,
        residenceZone,
        studentClass
      ];
}
