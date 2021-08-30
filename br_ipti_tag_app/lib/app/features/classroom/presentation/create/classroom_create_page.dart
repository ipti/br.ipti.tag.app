import 'package:br_ipti_tag_app/app/shared/util/util.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/components/shared/masks.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'bloc/classroom_create_bloc.dart';
import 'bloc/classroom_create_events.dart';
import 'bloc/classroom_states.dart';

class ClassroomCreatePage extends StatefulWidget {
  final String title;
  const ClassroomCreatePage({Key key, this.title = 'Adicionar Turma'})
      : super(key: key);
  @override
  ClassroomCreatePageState createState() => ClassroomCreatePageState();
}

class ClassroomCreatePageState
    extends ModularState<ClassroomCreatePage, ClassroomCreateBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        aside: Container(),
        title: widget.title,
        description: "",
        path: ["Turmas", widget.title],
        body: const <Widget>[
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(
                child: Text("Dados da Turma"),
              ),
            ],
          ),
          ClassroomBasicDataForm()
        ],
      ),
    );
  }
}

class ClassroomBasicDataForm extends StatefulWidget {
  const ClassroomBasicDataForm({Key key}) : super(key: key);

  @override
  _ClassroomBasicDataFormState createState() => _ClassroomBasicDataFormState();
}

class _ClassroomBasicDataFormState extends State<ClassroomBasicDataForm> {
  final controller = Modular.get<ClassroomCreateBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    const heading = Heading(text: "Turma", type: HeadingType.Title2);

    Widget inputName(String name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    Widget inputStartTime(TimeOfDay startTime) => TagTextField(
          label: "Horário Inicial",
          hint: "Digite o nome do aluno",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setStartTime(stringToTimeOfDay(value));
          },
          value: startTime.format(context),
          validator: requiredTimeValidator,
        );

    Widget inputEndTime(TimeOfDay endTime) => TagTextField(
          label: "Horário Final",
          hint: "Digite o nome do aluno",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setEndTime(stringToTimeOfDay(value));
          },
          value: endTime.format(context),
          validator: requiredTimeValidator,
        );
    Widget selectModality(int modality) => TagDropdownField(
          label: 'Modalidade de ensino',
          hint: "Selecione a modalidade",
          items: controller.modalitiesList,
          onChanged: controller.setModality,
          value: modality,
          validator: requiredValidator,
        );
    Widget selectStage(int nationality) => TagDropdownField(
          label: 'Etapa de Ensino',
          hint: "Selecione a etapa",
          items: controller.stagesList,
          onChanged: controller.setStage,
          value: nationality,
          validator: requiredValidator,
        );

    return Form(
      key: _formKey,
      child: BlocBuilder<ClassroomCreateBloc, ClassroomCreateState>(
          bloc: controller,
          builder: (context, state) {
            if (state is ClassroomCreateFormState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      withPadding(heading),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(inputName(state.name)),
                        ),
                        Flexible(
                          child: withPadding(inputStartTime(state.startTime)),
                        )
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(selectModality(state.modalityId)),
                        ),
                        Flexible(
                          child: withPadding(inputEndTime(state.endTime)),
                        )
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(selectStage(state.stageId)),
                        ),
                        Flexible(child: Container()),
                      ]),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
