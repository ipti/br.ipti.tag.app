import 'package:equatable/equatable.dart';

class EnrollmentFiliationState extends Equatable {
  const EnrollmentFiliationState({
    required this.name,
    required this.cpf,
    required this.rg,
    required this.nationality,
    required this.colorRace,
    required this.scholarity,
    required this.job,
    required this.email,
    required this.phone,
  });

  final String name;
  final String cpf;
  final String rg;
  final int nationality;
  final int colorRace;
  final int scholarity;
  final String job;
  final String email;
  final String phone;

  @override
  List<Object?> get props => [];

  EnrollmentFiliationState copyWith({
    String? name,
    String? cpf,
    String? rg,
    int? nationality,
    int? colorRace,
    int? scholarity,
    String? job,
    String? email,
    String? phone,
  }) {
    return EnrollmentFiliationState(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      nationality: nationality ?? this.nationality,
      colorRace: colorRace ?? this.colorRace,
      scholarity: scholarity ?? this.scholarity,
      job: job ?? this.job,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}

class EmptyEnrollmentFiliationState extends EnrollmentFiliationState {
  const EmptyEnrollmentFiliationState()
      : super(
            name: "",
            cpf: "",
            colorRace: 0,
            email: "",
            job: "",
            phone: "",
            nationality: 0,
            rg: "",
            scholarity: 0);
}
