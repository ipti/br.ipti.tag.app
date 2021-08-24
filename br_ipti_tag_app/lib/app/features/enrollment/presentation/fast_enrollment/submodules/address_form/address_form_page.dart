import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'bloc/address_form_bloc.dart';
import 'bloc/address_form_states.dart';

class AddressFormPage extends StatefulWidget {
  AddressFormPage({Key key}) : super(key: key);

  @override
  _AddressFormPageState createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final controller = Modular.get<AddressFormBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    final withPadding = (widget) => Padding(padding: padding, child: widget);

    final heading = Heading(text: "Turma", type: HeadingType.Title2);

    final selectResidenceZone = (initialValue) => TagDropdownField(
          label: 'Localização / Zona de residência',
          items: controller.residenceZoneItems,
          value: initialValue,
          onChanged: controller.setResidenceZone,
        );

    return Form(
      key: _formKey,
      child: BlocConsumer<AddressFormBloc, AddressFormState>(
          bloc: controller,
          listener: (_, state) => print(state.toString()),
          builder: (context, state) {
            if (state is AddressFormState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      withPadding(heading),
                      withPadding(selectResidenceZone(state.residenceZone)),
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
