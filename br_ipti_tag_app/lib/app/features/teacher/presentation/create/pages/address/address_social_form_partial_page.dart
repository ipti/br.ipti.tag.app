import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/submit_buttons_row/submit_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '_address_form_partial.dart';
import '_social_form_partial.dart';
import 'bloc/enrollment_address_bloc.dart';
import 'bloc/enrollment_address_states.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({
    Key? key,
    this.editMode = EditMode.Create,
  }) : super(key: key);

  final EditMode editMode;

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

const padding = EdgeInsets.symmetric(vertical: 8);

class AddressFormPageState extends State<AddressFormPage> {
  @override
  void initState() {
    controller.fetchUFs();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<InstructorAddressBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructorAddressBloc, InstructorAddressState>(
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
                    AddressForm(
                      controller: controller,
                      state: state,
                    ),
                    SocialForm(
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
