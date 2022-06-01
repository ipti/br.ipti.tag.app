import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_address_bloc.dart';
import 'bloc/enrollment_address_states.dart';

const headingAddress = Heading(text: "Endereço", type: HeadingType.Title3);
const padding = EdgeInsets.symmetric(vertical: 8);

class AddressForm extends StatelessWidget {
  const AddressForm({
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
              child: _CEPField(
                cep: state.cep,
                controller: controller,
              ),
            ),
            Flexible(
              child: _UFField(
                edcensoUfFk: state.edcensoUfFk,
                controller: controller,
              ),
            ),
            Flexible(
              flex: 3,
              child: _CityField(
                edcensoCityFk: state.edcensoCityFk,
                controller: controller,
              ),
            ),
          ],
        ),
        // Second Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: _AddressField(
                address: state.address,
                controller: controller,
              ),
            ),
          ],
        ),
        // Third Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: _AddressNumberField(
                number: state.number,
                controller: controller,
              ),
            ),
            Flexible(
              flex: 4,
              child: _NeighborhoodField(
                neighborhood: state.neighborhood,
                controller: controller,
              ),
            ),
          ],
        ),
        // Fourth Row
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: _ComplementField(
                complement: state.complement,
                controller: controller,
              ),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              flex: 4,
              child: _ZoneField(
                residenceZone: state.residenceZone,
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CEPField extends StatelessWidget {
  const _CEPField({
    Key? key,
    required this.cep,
    required this.controller,
  }) : super(key: key);

  final String cep;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_CEP"),
      label: "CEP",
      hint: "Digite o CEP",
      onChanged: controller.setCEP,
      formatters: [TagMasks.maskCEP],
      value: TagMasks.maskCEP.maskText(cep),
      validator: MultiValidator([
        postalValidator,
      ]),
    );
  }
}

class _UFField extends StatelessWidget {
  const _UFField({
    Key? key,
    required this.edcensoUfFk,
    required this.controller,
  }) : super(key: key);

  final String edcensoUfFk;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<String>(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_UF"),
      label: "UF",
      hint: "Selecione a UF",
      items: controller.state.ufs,
      onChanged: controller.setUf,
      value: edcensoUfFk,
    );
  }
}

class _CityField extends StatelessWidget {
  const _CityField({
    Key? key,
    required this.edcensoCityFk,
    required this.controller,
  }) : super(key: key);

  final String? edcensoCityFk;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<String>(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_CITY"),
      label: 'Cidade',
      hint: "Selecione a cidade",
      items: controller.state.cities,
      onChanged: controller.setCity,
      value: edcensoCityFk,
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({
    Key? key,
    required this.address,
    required this.controller,
  }) : super(key: key);

  final String address;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_ADDRESS"),
      label: "Endereço",
      hint: "Digite o endereço",
      onChanged: controller.setAddress,
      value: address,
    );
  }
}

class _AddressNumberField extends StatelessWidget {
  const _AddressNumberField({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  final String number;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_NUMBER"),
      label: "Número",
      hint: "Digite o número",
      onChanged: controller.setNumber,
      value: number,
    );
  }
}

class _NeighborhoodField extends StatelessWidget {
  const _NeighborhoodField({
    Key? key,
    required this.neighborhood,
    required this.controller,
  }) : super(key: key);

  final String neighborhood;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_NEIGHBORHOOD"),
      label: "Bairro",
      hint: "Digite o bairro",
      onChanged: controller.setNeighborhood,
      value: neighborhood,
    );
  }
}

class _ComplementField extends StatelessWidget {
  const _ComplementField({
    Key? key,
    required this.complement,
    required this.controller,
  }) : super(key: key);

  final String complement;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key("STUDENT_ENROLLMENT_ADDRESS_COMPLEMENT"),
      label: "Complemento",
      hint: "Digite o complemento",
      onChanged: controller.setComplement,
      value: complement,
    );
  }
}

class _ZoneField extends StatelessWidget {
  const _ZoneField({
    Key? key,
    required this.residenceZone,
    required this.controller,
  }) : super(key: key);

  final int residenceZone;
  final EnrollmentAddressBloc controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          key: const Key("STUDENT_ENROLLMENT_ADDRESS_ZONE"),
          value: residenceZone == 1,
          onChanged: (value) => controller.setZone(value! ? 2 : 1),
        ),
        const TagLabel("A residência fica em uma Zona Urbana"),
      ],
    );
  }
}
