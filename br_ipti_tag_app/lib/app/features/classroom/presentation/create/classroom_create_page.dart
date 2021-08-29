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
      initialIndex: 0,
      length: 1,
      child: TagDefaultPage(
        menu: TagVerticalMenu(),
        aside: Container(),
        title: widget.title,
        description: "",
        path: ["Turmas", widget.title],
        body: <Widget>[
          Container(
            child: TabBar(
              isScrollable: true,
              labelColor: TagColors.colorTabIndicator,
              indicatorColor: TagColors.colorTabIndicator,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              tabs: const [
                Tab(
                  child: Text("Dados da Turma"),
                ),
              ],
            ),
          ),
          ClassroomBasicDataForm()
        ],
      ),
    );
  }
}

class ClassroomBasicDataForm extends StatefulWidget {
  ClassroomBasicDataForm({Key key}) : super(key: key);

  @override
  _ClassroomBasicDataFormState createState() => _ClassroomBasicDataFormState();
}

class _ClassroomBasicDataFormState extends State<ClassroomBasicDataForm> {
  final controller = Modular.get<ClassroomCreateBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    final withPadding = (widget) => Padding(padding: padding, child: widget);

    final heading = Heading(text: "Turma", type: HeadingType.Title2);

    final inputName = (name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );
    final inputStartTime = (TimeOfDay startTime) => TagTextField(
          label: "Horário Inicial",
          hint: "Digite o nome do aluno",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setStartTime(stringToTimeOfDay(value));
          },
          value: startTime.format(context),
          validator: requiredTimeValidator,
        );

    final inputEndTime = (TimeOfDay endTime) => TagTextField(
          label: "Horário Final",
          hint: "Digite o nome do aluno",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setEndTime(stringToTimeOfDay(value));
          },
          value: endTime.format(context),
          validator: requiredTimeValidator,
        );
    final selectModality = (nationality) => TagDropdownField(
          label: 'Modalidade de ensino',
          hint: "Selecione a modalidade",
          items: controller.modalitiesList,
          onChanged: controller.setModality,
          value: nationality,
          validator: requiredValidator,
        );
    final selectStage = (nationality) => TagDropdownField(
          label: 'Etapa de Ensino',
          hint: "Selecione a etapa",
          items: controller.stagesList,
          onChanged: controller.setStage,
          value: nationality,
          validator: requiredValidator,
        );

    return Form(
      key: _formKey,
      child: BlocConsumer<ClassroomCreateBloc, ClassroomCreateState>(
          bloc: controller,
          listener: (_, state) => print(state.toString()),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
