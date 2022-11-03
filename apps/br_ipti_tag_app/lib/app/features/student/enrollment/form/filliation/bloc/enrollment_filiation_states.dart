import 'package:equatable/equatable.dart';

class EnrollmentFiliationState extends Equatable {
  // Responsable
  final String nameResponsable;
  final String cpfResponsable;
  final String rgResponsable;
  final int scholarityResponsable;
  final String jobResponsable;

  // Filiation1

  final String nameFiliation1;
  final String cpfFiliation1;
  final String rgFiliation1;
  final int scholarityFiliation1;
  final String jobFiliation1;

  // Filiation2
  final String nameFiliation2;
  final String cpfFiliation2;
  final String rgFiliation2;
  final int scholarityFiliation2;
  final String jobFiliation2;
  const EnrollmentFiliationState({
    required this.nameResponsable,
    required this.cpfResponsable,
    required this.rgResponsable,
    required this.scholarityResponsable,
    required this.jobResponsable,
    required this.nameFiliation1,
    required this.cpfFiliation1,
    required this.rgFiliation1,
    required this.scholarityFiliation1,
    required this.jobFiliation1,
    required this.nameFiliation2,
    required this.cpfFiliation2,
    required this.rgFiliation2,
    required this.scholarityFiliation2,
    required this.jobFiliation2,
  });

  @override
  List<Object> get props {
    return [
      nameResponsable,
      cpfResponsable,
      rgResponsable,
      scholarityResponsable,
      jobResponsable,
      nameFiliation1,
      cpfFiliation1,
      rgFiliation1,
      scholarityFiliation1,
      jobFiliation1,
      nameFiliation2,
      cpfFiliation2,
      rgFiliation2,
      scholarityFiliation2,
      jobFiliation2,
    ];
  }

  EnrollmentFiliationState copyWith({
    String? nameResponsable,
    String? cpfResponsable,
    String? rgResponsable,
    int? scholarityResponsable,
    String? jobResponsable,
    String? nameFiliation1,
    String? cpfFiliation1,
    String? rgFiliation1,
    int? scholarityFiliation1,
    String? jobFiliation1,
    String? nameFiliation2,
    String? cpfFiliation2,
    String? rgFiliation2,
    int? scholarityFiliation2,
    String? jobFiliation2,
  }) {
    return EnrollmentFiliationState(
      nameResponsable: nameResponsable ?? this.nameResponsable,
      cpfResponsable: cpfResponsable ?? this.cpfResponsable,
      rgResponsable: rgResponsable ?? this.rgResponsable,
      scholarityResponsable:
          scholarityResponsable ?? this.scholarityResponsable,
      jobResponsable: jobResponsable ?? this.jobResponsable,
      nameFiliation1: nameFiliation1 ?? this.nameFiliation1,
      cpfFiliation1: cpfFiliation1 ?? this.cpfFiliation1,
      rgFiliation1: rgFiliation1 ?? this.rgFiliation1,
      scholarityFiliation1: scholarityFiliation1 ?? this.scholarityFiliation1,
      jobFiliation1: jobFiliation1 ?? this.jobFiliation1,
      nameFiliation2: nameFiliation2 ?? this.nameFiliation2,
      cpfFiliation2: cpfFiliation2 ?? this.cpfFiliation2,
      rgFiliation2: rgFiliation2 ?? this.rgFiliation2,
      scholarityFiliation2: scholarityFiliation2 ?? this.scholarityFiliation2,
      jobFiliation2: jobFiliation2 ?? this.jobFiliation2,
    );
  }
}

class EmptyEnrollmentFiliationState extends EnrollmentFiliationState {
  const EmptyEnrollmentFiliationState()
      : super(
          nameResponsable: "",
          cpfResponsable: "",
          rgResponsable: "",
          scholarityResponsable: 0,
          jobResponsable: "",
          nameFiliation1: "",
          cpfFiliation1: "",
          rgFiliation1: "",
          scholarityFiliation1: 0,
          jobFiliation1: "",
          nameFiliation2: "",
          cpfFiliation2: "",
          rgFiliation2: "",
          scholarityFiliation2: 0,
          jobFiliation2: "",
        );
}
