import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_events.dart';
import 'bloc/enrollment_states.dart';

class EnrollmentPage extends StatefulWidget {
  final String title;
  const EnrollmentPage({Key key, this.title = 'Matrícula rápida'})
      : super(key: key);
  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.add(StartEditing());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: TagBackgroundColors.backgroundBody,
              title: SizedBox(
                height: TagSizes.heightServiceLogoMedium,
                child: LogoTag(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Heading(
                      text: "Cadastro de aluno",
                      type: HeadingType.Title1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis orci ligula, a viverra augue semper in. Quisque vulputate lobortis feugiat.",
                      style: TextStyle(
                        color: TagColors.colorTextSecondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    // height: 50,
                    child: TabBar(
                      labelColor: TagColors.colorTabIndicator,
                      indicatorColor: TagColors.colorTabIndicator,
                      tabs: [
                        Tab(
                          child: Text("Dados \ndo aluno"),
                        ),
                        Tab(
                          child: Text("Endereço"),
                        ),
                        Tab(
                          child: Text("Turma"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: SizedBox(
                          child: TabBarView(
                            children: [
                              _buildPersonalDataForm(),
                              _buildAddressDataForm(),
                              _buildPersonalDataForm(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildAddressDataForm() {
    const padding = EdgeInsets.all(8.0);

    final selectTypeAddress = TagDropdownField(
      label: 'Localização / Zona de residência',
      items: controller.residenceZoneItems,
      onChanged: controller.setResidenceZone,
    );

    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
        bloc: controller,
        listener: (_, state) => print(state.toString()),
        builder: (context, state) {
          if (state is EnrollmentState) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: padding, child: selectTypeAddress),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildPersonalDataForm() {
    const padding = EdgeInsets.all(8.0);

    final inputName = (name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    final inputBirthday = (birthday) => TagDatePickerField(
          label: "Data nascimento",
          hint: "__/__/____",
          onChanged: controller.setBirthday,
          value: birthday,
          validator: requiredValidator,
        );

    final selectSex = (sex) => TagDropdownField(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: controller.sexItems,
          onChanged: controller.setSex,
          value: sex,
          validator: requiredValidator,
        );

    final selectColorRace = (colorRace) => TagDropdownField(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: controller.colorRaceItems,
          onChanged: controller.setColorRace,
          value: colorRace,
          validator: requiredValidator,
        );

    final selectFiliation = (filiation) => TagDropdownField(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: controller.filiationItems,
          onChanged: controller.setFiliation,
          value: filiation,
          validator: requiredValidator,
        );

    final selectNationality = (nationality) => TagDropdownField(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: controller.nationalityItems,
          onChanged: controller.setNationality,
          value: nationality,
          validator: requiredValidator,
        );

    final deficiencyCheck = (deficiency) => Row(
          children: [
            Checkbox(
              value: deficiency ?? false,
              onChanged: controller.setDeficiency,
            ),
            TagLabel("Deficiência"),
          ],
        );

    final withPadding = (widget) => Padding(padding: padding, child: widget);

    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
        bloc: controller,
        listener: (_, state) => print(state.toString()),
        builder: (context, state) {
          if (state is EnrollmentState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  withPadding(Heading(
                      text: "Dados Pessoais", type: HeadingType.Title2)),
                  withPadding(inputName(state.name)),
                  withPadding(inputBirthday(state.birthday)),
                  withPadding(selectSex(state.sex)),
                  withPadding(selectColorRace(state.colorRace)),
                  withPadding(selectFiliation(state.filiation)),
                  withPadding(selectNationality(state.nationality)),
                  withPadding(deficiencyCheck(state.deficiency)),
                  withPadding(
                    TagButton(
                      text: "Enviar",
                      onPressed: () => _formKey.currentState.validate(),
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
