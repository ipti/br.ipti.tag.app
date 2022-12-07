import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/widgets/submit_buttons_row/submit_buttons_row.dart';

import 'package:br_ipti_tag_app/app/features/student/enrollment/form/address/_address_form_partial.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/form/address/_social_form_partial.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/form/address/bloc/enrollment_address_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'bloc/enrollment_address_bloc.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({
    super.key,
    this.editMode = EditMode.Create,
    this.model,
  });

  final StudentDocsAndAddress? model;
  final EditMode editMode;

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

const padding = EdgeInsets.symmetric(vertical: 8);

class AddressFormPageState extends State<AddressFormPage> {
  @override
  void initState() {
    controller.fetchUFs();
    if (widget.model != null) {
      controller.loadStudentDocsAndAddress(widget.model!);
    }
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
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
      },
    );
  }
}
