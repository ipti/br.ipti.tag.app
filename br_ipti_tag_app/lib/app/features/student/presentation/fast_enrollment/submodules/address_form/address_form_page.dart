import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

import 'bloc/address_form_bloc.dart';
import 'bloc/address_form_states.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({Key key}) : super(key: key);

  @override
  _AddressFormPageState createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final controller = Modular.get<AddressFormBloc>();
  final _formKey = GlobalKey<FormState>();

  Widget _withPadding(Widget widget) =>
      Padding(padding: const EdgeInsets.all(8.0), child: widget);

  Widget _buildResidenceZoneDropdown(int residenceZoneId) => TagDropdownField(
        label: 'Localização / Zona de residência',
        items: controller.residenceZoneItems,
        value: residenceZoneId,
        onChanged: controller.setResidenceZone,
      );

  @override
  Widget build(BuildContext context) {
    const heading = Heading(text: "Turma", type: HeadingType.Title2);

    return Form(
      key: _formKey,
      child: BlocBuilder<AddressFormBloc, AddressFormState>(
          bloc: controller,
          builder: (context, state) {
            if (state is AddressFormState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _withPadding(heading),
                      _withPadding(
                        _buildResidenceZoneDropdown(state.residenceZone),
                      ),
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
