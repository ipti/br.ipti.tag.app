import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_states.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class RightListClassroomUpdateWidget extends StatelessWidget {
  const RightListClassroomUpdateWidget({
    super.key,
    required this.onChangedAeeBraille,
    required this.onChangedAeeOpticalNonOptical,
    required this.state,
    required this.onChangedAeeCognitiveFunctions,
    required this.onChangedAeeMobilityTechniques,
    required this.onChangedAeeLibras,
    required this.onChangedAeeCaa,
    required this.onChangedAeeCurriculumEnrichment,
    required this.onChangedAeeAccessibleTeaching,
    required this.onChangedAeePortuguese,
    required this.onChangedAeeSoroban,
    required this.onChangedAeeAutonomousLife,
  });
  final ClassroomUpdateDeleteFormState state;
  final void Function(bool?)? onChangedAeeBraille;
  final void Function(bool?)? onChangedAeeOpticalNonOptical;
  final void Function(bool?)? onChangedAeeCognitiveFunctions;
  final void Function(bool?)? onChangedAeeMobilityTechniques;
  final void Function(bool?)? onChangedAeeLibras;
  final void Function(bool?)? onChangedAeeCaa;
  final void Function(bool?)? onChangedAeeCurriculumEnrichment;
  final void Function(bool?)? onChangedAeeAccessibleTeaching;
  final void Function(bool?)? onChangedAeePortuguese;
  final void Function(bool?)? onChangedAeeSoroban;
  final void Function(bool?)? onChangedAeeAutonomousLife;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textLabel(
          text: 'Atividades do Atendimento Educacional Especializado',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeBraille,
          value: state.aeeBraille,
          label: 'Ensino do Sistema Braille',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeOpticalNonOptical,
          value: state.aeeOpticalNonOptical,
          label: 'Ensino do uso de recursos ópticos e não ópticos',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeCognitiveFunctions,
          value: state.aeeCognitiveFunctions,
          label: 'Estratégias para o desenvolvimento de processos mentais',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeMobilityTechniques,
          value: state.aeeMobilityTechniques,
          label: 'Técnicas de orientação e mobilidade',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeLibras,
          value: state.aeeLibras,
          label: 'Ensino da Língua Brasileira de Sinais (Libras)',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeCaa,
          value: state.aeeCaa,
          label: 'Ensino de uso da Comunicação Alternativa e Aumentativa - CAA',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeCurriculumEnrichment,
          value: state.aeeCurriculumEnrichment,
          label: 'Estratégias para o enriquecimento curricular',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeAccessibleTeaching,
          value: state.aeeAccessibleTeaching,
          label:
              '''Ensino da usabilidade e das funcionalidades da informática acessível''',
        ),
        CheckboxWidget(
          onChanged: onChangedAeePortuguese,
          value: state.aeePortuguese,
          label: 'Ensino da Língua Portuguesa na modalidade escrita',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeSoroban,
          value: state.aeeSoroban,
          label: 'Ensino do uso do Soroban',
        ),
        CheckboxWidget(
          onChanged: onChangedAeeAutonomousLife,
          value: state.aeeAutonomousLife,
          label: 'Estratégias para autonomia no ambiente escolar',
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
