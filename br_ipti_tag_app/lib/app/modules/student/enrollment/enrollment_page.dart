import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/components/tag_label.dart';
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

class EnrollmentPageState extends State<EnrollmentPage> {
  EnrollmentBloc _controller = Modular.get();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller.add(StartEditing());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.house)),
              Tab(icon: Icon(Icons.book)),
            ]),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TabBarView(
                children: [
                  _buildPersonalDataForm(),
                  _buildAddressDataForm(),
                  _buildPersonalDataForm(),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildAddressDataForm() {
    const padding = EdgeInsets.all(8.0);

    final selectTypeAddress = TagDropdownField(
      label: 'Localização / Zona de residência',
      items: _controller.residenceZoneItems,
      onChanged: _controller.setResidenceZone,
    );

    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
        bloc: _controller,
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
          onChanged: _controller.setName,
          value: name,
          validator: requiredValidator,
        );

    final inputBirthday = (birthday) => TagTextField(
          label: "Data nascimento",
          hint: "dd/mm/aaaa",
          inputType: TextInputType.datetime,
          onChanged: _controller.setBirthday,
          value: birthday,
          validator: requiredValidator,
        );

    final selectSex = (sex) => TagDropdownField(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: _controller.sexItems,
          onChanged: _controller.setSex,
          value: sex,
          validator: requiredValidator,
        );

    final selectColorRace = (colorRace) => TagDropdownField(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: _controller.colorRaceItems,
          onChanged: _controller.setColorRace,
          value: colorRace,
          validator: requiredValidator,
        );

    final selectFiliation = (filiation) => TagDropdownField(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: _controller.filiationItems,
          onChanged: _controller.setFiliation,
          value: filiation,
          validator: requiredValidator,
        );

    final selectNationality = (nationality) => TagDropdownField(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: _controller.nationalityItems,
          onChanged: _controller.setNationality,
          value: nationality,
          validator: requiredValidator,
        );

    final deficiencyCheck = (deficiency) => Row(
          children: [
            Checkbox(
              value: deficiency ?? false,
              onChanged: _controller.setDeficiency,
            ),
            TagLabel("Deficiência"),
          ],
        );

    final withPadding = (widget) => Padding(padding: padding, child: widget);

    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
        bloc: _controller,
        listener: (_, state) => print(state.toString()),
        builder: (context, state) {
          if (state is EnrollmentState) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  withPadding(inputName(state.name)),
                  withPadding(inputBirthday(state.birthday)),
                  withPadding(selectSex(state.sex)),
                  withPadding(selectColorRace(state.colorRace)),
                  withPadding(selectFiliation(state.filiation)),
                  withPadding(selectNationality(state.nationality)),
                  withPadding(deficiencyCheck(state.deficiency)),
                  withPadding(
                    ElevatedButton(
                      onPressed: () => _formKey.currentState.validate(),
                      child: Text("Enviar"),
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
