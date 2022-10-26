import 'package:br_ipti_tag_app/app/core/strings/file_paths.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_states.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/add_teacher_dialog.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class ClassroomTeacherPage extends StatefulWidget {
  const ClassroomTeacherPage({super.key, required this.classroomId});
  final String classroomId;

  @override
  State<ClassroomTeacherPage> createState() => _ClassroomTeacherPageState();
}

class _ClassroomTeacherPageState extends State<ClassroomTeacherPage> {
  final controller = Modular.get<UpdateTeacherBloc>();
  final String erro =
      "Ocorreu um problema inesperado, tente novamente mais tarde.";
  @override
  void initState() {
    controller.classroomId = widget.classroomId;
    controller.fetchListClassroomsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          BlocBuilder<UpdateTeacherBloc, UpdateTeacherState>(
            bloc: controller,
            builder: (context, state) {
              if (state is UpdateTeacherStateLoading) {
                return const CircularProgressIndicator();
              }
              if (state is UpdateTeacherStateSuccess) {
                return TagDataTable(
                  columns: const [
                    DataColumn(
                      label: Text("Nome"),
                    ),
                    DataColumn(
                      label: Text("Etapa"),
                    ),
                    DataColumn(
                      label: Text(""),
                    ),
                  ],
                  source: InstructorDatatable(
                    data: state.instructors,
                    disciplines: state.disciplinesOfInstructor,
                    classroomId: widget.classroomId,
                    context: context,
                    instructorTeachingData: state.instructorsTeachingData,
                  ),
                );
              }

              return Container();
            },
          ),
          TagButtonIcon(
            buttonStyle: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: TagColors.colorBaseProductNormal,
              padding: TagSpancing.paddingButtonNormal,
              minimumSize: const Size(40, TagSizes.heightButtonNormal),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    TagBorderRadiusValues.borderRadiusNormal,
                  ),
                ),
              ),
            ),
            label: 'Adicionar professor por disciplina',
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final success = await showDialog(
                context: context,
                builder: (_) {
                  return AddTeacherDialog(
                    classroomId: widget.classroomId,
                  );
                },
              );
              if (success) {
                scaffoldMessenger.showSnackBar(
                  const SnackBar(
                    backgroundColor: TagColors.colorBaseProductNormal,
                    content: Text(
                      "Professor cadastrado na turma com sucesso!",
                    ),
                  ),
                );
              } else {
                scaffoldMessenger.showSnackBar(
                  SnackBar(
                    backgroundColor: TagColors.colorRedDark,
                    content: Text(
                      erro,
                    ),
                  ),
                );
              }
            },
            icon: FilePaths.INFO_ICON_SVG,
            textStyle: const TextStyle(color: TagColors.colorBaseWhiteNormal),
          ),
        ],
      ),
    );
  }
}

class InstructorDatatable extends DataTableSource {
  InstructorDatatable({
    required this.data,
    required this.disciplines,
    required this.classroomId,
    required this.context,
    required this.instructorTeachingData,
  });

  final List<InstructorEntity> data;
  final List<List<EdcensoDisciplinesEntity>> disciplines;
  final String classroomId;
  final BuildContext context;
  final List<InstructorTeachingDataEntity> instructorTeachingData;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        data[index].name.toUpperCase(),
      )),
      DataCell(Text(
        disciplines[index].map((e) => e.name).join(','),
      )),
      DataCell(
        GestureDetector(
          onTap: () async => showDialog(
            context: context,
            builder: (context) {
              return AddTeacherDialog(
                classroomId: classroomId,
                disciplineIdFk: disciplines[index].first.id,
                instructorEntity: data[index],
                instructorTeachingDataEntity: instructorTeachingData[index],
              );
            },
          ),
          child: const Icon(
            Icons.edit,
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
