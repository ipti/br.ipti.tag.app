import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_address_bloc.dart';
import 'bloc/enrollment_address_states.dart';

const headingSocial = Heading(text: "Dados sociais", type: HeadingType.Title3);
const padding = EdgeInsets.symmetric(vertical: 8);

class SocialForm extends StatelessWidget {
  const SocialForm({
    super.key,
    required this.controller,
    required this.state,
  });

  final EnrollmentAddressBloc controller;
  final EnrollmentAddressState state;

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: padding,
          child: headingSocial,
        ),
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: _NISField(
                nis: state.nis,
                controller: controller,
              ),
            ),
            Flexible(
              flex: 4,
              child: _INEPField(
                inepId: state.inepId,
                controller: controller,
              ),
            ),
          ],
        ),
        // First Row
      ],
    );
  }
}

class _INEPField extends StatelessWidget {
  const _INEPField({
    required this.inepId,
    required this.controller,
  });

  final String inepId;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_SOCIAL_INEPID"),
      label: "ID INEP",
      hint: "Digite o ccódigo INEP",
      onChanged: controller.setInepId,
      value: inepId,
    );
  }
}

class _NISField extends StatelessWidget {
  const _NISField({
    required this.nis,
    required this.controller,
  });

  final String nis;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_SOCIAL_NIS"),
      label: "Número de indentificação social  (NIS)",
      hint: "Digite o código NIS",
      value: nis,
      onChanged: controller.setNis,
    );
  }
}
