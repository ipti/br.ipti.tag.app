import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_events.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_states.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

class AddTeacherDialog extends StatefulWidget {
  const AddTeacherDialog(
      {Key? key,
      required this.classroomId,
      this.instructorEntity,
      this.disciplineIdFk})
      : super(key: key);
  final String classroomId;
  final InstructorEntity? instructorEntity;
  final String? disciplineIdFk;

  @override
  State<AddTeacherDialog> createState() => _AddTeacherDialogState();
}

class _AddTeacherDialogState extends State<AddTeacherDialog> {
  final controller = Modular.get<InstructorFormBloc>();
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    controller.setClassroomId(widget.classroomId);
    if (widget.instructorEntity != null) {
      controller.add(UpdateInstructorForm(
          schoolInepIdFk: widget.instructorEntity!.schoolInepIdFk,
          discipline1Fk: widget.disciplineIdFk!,
          instructorFk: widget.instructorEntity!.id,
          role: 1));
    } else {
      controller.add(LoadInstructorForm());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 17,
                right: 12,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    FilePaths.ICON_CLOSE_SVG,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 10,
              color: TagColors.colorBaseProductDark,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BlocBuilder<InstructorFormBloc, InstructorFormState>(
                  bloc: controller,
                  builder: (context, state) {
                    if (state is InstructorFormStateSuccess) {
                      return TagDropdownField<String>(
                        items: Map.fromEntries(state.instructors!.map(
                          (e) => MapEntry(e.id, e.name),
                        )),
                        hint: 'Selecione',
                        onChanged: (instructor) =>
                            controller.changeCurrentInstructor(instructor),
                        label: 'Professor',
                        value: controller.currentInstructor,
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: BlocBuilder<InstructorFormBloc, InstructorFormState>(
                  bloc: controller,
                  builder: (context, state) {
                    if (state is InstructorFormStateSuccess) {
                      return TagDropdownField(
                        items: Map.fromEntries(state.disciplines!.map(
                          (e) => MapEntry(e.id, e.name),
                        )),
                        hint: 'Selecione',
                        onChanged: (discipline) =>
                            controller.changeCurrentDiscipline(discipline),
                        label: 'Disciplinas',
                        value: controller.currentDiscipline,
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'Professor',
                  1: 'Auxiliar',
                  2: 'Monitor',
                  3: 'Intérprete',
                },
                hint: 'Selecione',
                onChanged: (cargo) => controller.changeRole(cargo),
                label: 'Cargo',
                value: controller.currentRole,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'Concursado/Efetivo',
                  1: 'Temporário',
                  2: 'Terceirizado',
                  3: 'CLT',
                },
                hint: 'Selecione',
                onChanged: (contrato) =>
                    controller.changeContractType(contrato),
                label: 'Tipo de Contrato',
                value: controller.currentContractType,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TagButton(
                    text: 'Cancelar',
                    onPressed: () {
                      debugPrint('cancelado');
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TagButton(
                    text: 'Adicionar',
                    onPressed: () {
                      widget.instructorEntity == null
                          ? controller.add(SubmitInstructorForm())
                          : controller.add(SubmitUpdateInstructorForm(
                              instructorTeachingDataId:
                                  widget.instructorEntity!.id));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
