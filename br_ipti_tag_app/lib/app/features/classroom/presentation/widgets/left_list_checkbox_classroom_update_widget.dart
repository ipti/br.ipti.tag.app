import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_states.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class LeftListClassroomUpdateWidget extends StatelessWidget {
  const LeftListClassroomUpdateWidget({
    Key? key,
    required this.onChangedSchooling,
    required this.onChangedAee,
    required this.onChangedComplementaryActivity,
    required this.onChangedMoreEducatorParticipator,
    required this.state,
  }) : super(key: key);
  final void Function(bool?)? onChangedSchooling;
  final void Function(bool?)? onChangedComplementaryActivity;
  final void Function(bool?)? onChangedAee;
  final void Function(bool?)? onChangedMoreEducatorParticipator;
  final ClassroomUpdateDeleteFormState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textLabel(
          text: 'Tipos de Atendimento',
        ),
        CheckboxWidget(
          onChanged: onChangedSchooling,
          value: state.schooling,
          label: 'Escolarização',
        ),
        CheckboxWidget(
          onChanged: onChangedComplementaryActivity,
          value: state.complementaryActivity,
          label: 'Atividade Complementar',
        ),
        CheckboxWidget(
          onChanged: onChangedAee,
          value: state.aee,
          label: 'Atendimento Educacional Especializado(AEE)',
        ),
        textLabel(
          text: 'Participa do programa Mais Educação',
        ),
        CheckboxWidget(
          onChanged: onChangedMoreEducatorParticipator,
          value: state.moreEducationParticipator,
          label: 'Sim',
        ),
      ],
    );
  }

  Widget textLabel({required String text}) {
    return Heading(
      text: text,
      type: HeadingType.Title4,
      color: Colors.black,
    );
  }
}
