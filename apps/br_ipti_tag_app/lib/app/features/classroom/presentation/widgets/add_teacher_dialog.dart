import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_events.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class AddTeacherDialog extends StatefulWidget {
  const AddTeacherDialog({
    super.key,
    required this.classroomId,
    this.instructorTeachingDataEntity,
    this.instructor,
    this.disciplineIdFk,
  });
  final int classroomId;
  final Instructor? instructor;
  final int? disciplineIdFk;
  final InstructorTeachingDataEntity? instructorTeachingDataEntity;

  @override
  State<AddTeacherDialog> createState() => _AddTeacherDialogState();
}

class _AddTeacherDialogState extends State<AddTeacherDialog> {
  final controller = Modular.get<InstructorFormBloc>();
  final ScrollController scrollController = ScrollController();
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final professorTipoMap = Map.fromEntries(
    ProfessorTipo.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );
  final professorCargoMap = Map.fromEntries(
    ProfessorCargo.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );
  @override
  void initState() {
    controller.classroomId = widget.classroomId;
    if (widget.instructor != null) {
      controller.add(
        UpdateInstructorForm(
          schoolInepIdFk: widget.instructor!.schoolInepIdFk!,
          discipline1Fk: widget.disciplineIdFk!,
          instructorFk: widget.instructor!.id!,
          role: 1,
        ),
      );
    } else {
      controller.add(
        LoadInstructorForm(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
                    return Column(
                      children: [
                        TagDropdownField<int>(
                          items: Map.fromEntries(
                            state.instructors!.map(
                              (e) => MapEntry(e.id!, e.name??""),
                            ),
                          ),
                          hint: 'Selecione',
                          onChanged: (instructor) =>
                              controller.currentInstructor = instructor!,
                          label: 'Professor',
                          value: controller.currentInstructor,
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        TagDropdownField<int>(
                          items: Map.fromEntries(
                            state.disciplines!.map(
                              (e) => MapEntry(e.id, e.name),
                            ),
                          ),
                          hint: 'Selecione',
                          onChanged: (discipline) =>
                              controller.changeCurrentDiscipline = discipline!,
                          label: 'Disciplinas',
                          value: controller.changeCurrentDiscipline,
                        ),
                        TagButton(
                          text: "Adicionar",
                          onPressed: () {
                            _animatedListKey.currentState!.insertItem(
                              0,
                            );
                            controller.selectedDisciplines.insert(
                              0,
                              controller.changeCurrentDiscipline,
                            );
                          },
                        ),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: AnimatedList(
                            key: _animatedListKey,
                            itemBuilder: (context, index, animation) =>
                                SlideTransition(
                              position: animation.drive(
                                Tween(
                                  begin: const Offset(0.0, -1.0),
                                  end: Offset.zero,
                                ),
                              ),
                              child: Container(
                                height: 40,
                                color: TagColors.colorBaseProductLighter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.disciplines!
                                          .map(
                                            (e) => MapEntry(
                                              e.id,
                                              e.name,
                                            ),
                                          )
                                          .firstWhere(
                                            (discipline) =>
                                                discipline.key ==
                                                controller
                                                    .selectedDisciplines[index],
                                          )
                                          .value,
                                      style: const TextStyle(
                                        color: TagColors.colorBaseInkNormal,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _animatedListKey.currentState!
                                            .removeItem(
                                          index,
                                          (context, animation) =>
                                              SlideTransition(
                                            position: animation.drive(
                                              Tween(
                                                begin: const Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                                end: const Offset(
                                                  3.0,
                                                  1.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                        controller.selectedDisciplines
                                            .removeAt(index);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is InstructorFormStateError) {
                    Navigator.of(context).pop(false);
                  } else if (state is InstructorFormStateInsertSuccess) {
                    Navigator.of(context).pop(true);
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField<int>(
                items: professorTipoMap,
                hint: 'Selecione',
                onChanged: controller.changeRole,
                label: 'Cargo',
                value: controller.currentRole,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField<int>(
                items: professorCargoMap,
                hint: 'Selecione',
                onChanged: (contrato) =>
                    controller.changeContractType(contrato!),
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
                      widget.instructor == null
                          ? controller.add(
                              SubmitInstructorForm(),
                            )
                          : controller.add(
                              SubmitUpdateInstructorForm(
                                instructorTeachingDataId: widget
                                    .instructorTeachingDataEntity!.instructorId,
                              ),
                            );
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
