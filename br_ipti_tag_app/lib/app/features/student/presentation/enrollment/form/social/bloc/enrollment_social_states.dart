import 'package:equatable/equatable.dart';

class EnrollmentSocialState extends Equatable {
  const EnrollmentSocialState({
    required this.nis,
    required this.inepId,
    required this.bfParticipator,
    required this.posCenso,
  });

  final String nis;
  final String inepId;
  final bool bfParticipator;
  final bool posCenso;

  @override
  List<Object?> get props => [];

  EnrollmentSocialState copyWith({
    String? nis,
    String? inepId,
    bool? bfParticipator,
    bool? posCenso,
  }) {
    return EnrollmentSocialState(
      nis: nis ?? this.nis,
      inepId: inepId ?? this.inepId,
      bfParticipator: bfParticipator ?? this.bfParticipator,
      posCenso: posCenso ?? this.posCenso,
    );
  }
}

class EmptyEnrollmentSocialState extends EnrollmentSocialState {
  const EmptyEnrollmentSocialState()
      : super(
          nis: "",
          inepId: "",
          bfParticipator: false,
          posCenso: false,
        );
}
