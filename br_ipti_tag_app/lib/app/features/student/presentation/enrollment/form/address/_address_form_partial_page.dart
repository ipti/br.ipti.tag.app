import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/address/bloc/enrollment_address_states.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_address_bloc.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({
    Key? key,
    this.editMode = EditMode.Create,
    this.model,
  }) : super(key: key);

  final StudentDocsAddress? model;
  final EditMode editMode;

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

const headingAddress = Heading(text: "Endereço", type: HeadingType.Title3);
const headingSocial = Heading(text: "Dados sociais", type: HeadingType.Title3);
const padding = EdgeInsets.symmetric(vertical: 8);

class AddressFormPageState extends State<AddressFormPage> {
  @override
  void initState() {
    controller.fetchUFs();
    if (widget.model != null) controller.loadStudentDocsAddress(widget.model!);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnrollmentAddressBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollmentAddressBloc, EnrollmentAddressState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _AddressForm(
                      controller: controller,
                      state: state,
                    ),
                    _SocialForm(
                      controller: controller,
                      state: state,
                    ),
                    SubmitButtonsRow(
                      onSubmitAndGo: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitAddressForm(widget.editMode);
                        }
                      },
                      onSubmitAndStay: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitAddressForm(widget.editMode);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm({
    Key? key,
    required this.controller,
    required this.state,
  }) : super(key: key);

  final EnrollmentAddressBloc controller;
  final EnrollmentAddressState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: padding,
          child: headingAddress,
        ),
        // First Row
        RowToColumn(
          children: [
            Flexible(
              flex: 3,
              child: TagTextField(
                label: "CEP",
                hint: "Digite o CEP",
                onChanged: controller.setCEP,
                formatters: [TagMasks.maskCEP],
                value: state.cep,
                validator: requiredValidator,
              ),
            ),
            Flexible(
              child: TagDropdownField<String>(
                label: "UF",
                hint: "Selecione a UF",
                items: state.ufs,
                onChanged: controller.setUf,
                value: state.edcensoUfFk,
                validator: requiredValidator,
              ),
            ),
            Flexible(
              flex: 3,
              child: TagDropdownField<String>(
                label: 'Cidade',
                hint: "Selecione a cidade",
                items: state.cities,
                onChanged: controller.setCity,
                value: state.edcensoCityFk,
                validator: requiredValidator,
              ),
            ),
          ],
        ),
        // Second Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: TagTextField(
                label: "Endereço",
                hint: "Digite o endereço",
                onChanged: controller.setAddress,
                value: state.address,
                validator: requiredValidator,
              ),
            ),
          ],
        ),
        // Third Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: TagTextField(
                label: "Número",
                hint: "Digite o número",
                onChanged: controller.setNumber,
                value: state.number,
                validator: requiredValidator,
              ),
            ),
            Flexible(
              flex: 4,
              child: TagTextField(
                label: "Bairro",
                hint: "Digite o bairro",
                onChanged: controller.setNeighborhood,
                value: state.neighborhood,
                validator: requiredValidator,
              ),
            ),
          ],
        ),
        // Fourth Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: TagTextField(
                label: "Complemento",
                hint: "Digite o número",
                onChanged: controller.setComplement,
                value: state.number,
                validator: requiredValidator,
              ),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: Row(
                children: [
                  Checkbox(
                    value: state.residenceZone == 1,
                    onChanged: (value) => controller.setZone(value! ? 1 : 0),
                  ),
                  const TagLabel("A residência fica em uma Zona Urbana"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialForm extends StatelessWidget {
  const _SocialForm({
    Key? key,
    required this.controller,
    required this.state,
  }) : super(key: key);

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
              child: TagTextField(
                label: "Número de indentificação social  (NIS)",
                hint: "Digite o código NIS",
                onChanged: controller.setNis,
                value: state.nis,
                validator: requiredValidator,
              ),
            ),
            Flexible(
              flex: 4,
              child: TagTextField(
                label: "ID INEP",
                hint: "Digite o ccódigo INEP",
                onChanged: controller.setInepId,
                value: state.inepId,
                validator: requiredValidator,
              ),
            ),
          ],
        ),
        // First Row
      ],
    );
  }
}
