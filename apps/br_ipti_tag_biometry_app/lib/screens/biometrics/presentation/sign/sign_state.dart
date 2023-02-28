// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SignState extends Equatable {
      final StudentIdentification? student;
      final BioEvents event;

  const SignState(this.student, this.event);

  SignState copyWith({
    StudentIdentification? student,
    BioEvents? event,
  }) {
    return SignState(
      student ?? this.student,
      event ?? this.event,
    );
  }

  @override
  List<Object> get props => [student ?? "", event];
}
