import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/address/bloc/enrollment_address_states.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_address_bloc.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({Key? key}) : super(key: key);

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

const heading = Heading(text: "Endereço", type: HeadingType.Title3);

class AddressFormPageState extends State<AddressFormPage> {
  @override
  void initState() {
    super.initState();
    controller.fetchUFs();
  }

  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnrollmentAddressBloc>();
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 8);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

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
                    withPadding(heading),
                    // First Row
                    RowToColumn(
                      children: [
                        Flexible(
                          flex: 3,
                          child: TagTextField(
                            label: "CEP",
                            hint: "Digite o CEP",
                            onChanged: controller.setCEP,
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
                            onChanged: controller.setNumber,
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
                                onChanged: (value) =>
                                    controller.setZone(value! ? 1 : 0),
                              ),
                              const TagLabel(
                                  "A residência fica em uma Zona Urbana"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SubmitButtonsRow(
                      onSubmitAndGo: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitAddressForm();
                        }
                      },
                      onSubmitAndStay: () {
                        if (_formKey.currentState!.validate()) {
                          // controller.submitPersonalForm();
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
