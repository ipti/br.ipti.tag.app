import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/submit_buttons_row/submit_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_social_bloc.dart';
import 'bloc/enrollment_social_states.dart';

class SocialFormPage extends StatefulWidget {
  const SocialFormPage({Key? key, this.model, this.editMode = EditMode.Create})
      : super(key: key);

  final StudentDocsAddress? model;
  final EditMode editMode;

  @override
  SocialFormPageState createState() => SocialFormPageState();
}

const heading = Heading(text: "Dados sociais", type: HeadingType.Title3);

class SocialFormPageState extends State<SocialFormPage> {
  final controller = Modular.get<EnrollmentSocialBloc>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.model != null) controller.loadStudentDocsAddress(widget.model!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputNis(String? nis) => TagTextField(
          label: "Número de indentificação social  (NIS)",
          hint: "Digite o código NIS",
          onChanged: controller.setNis,
          value: nis,
          validator: requiredValidator,
        );

    Widget inputInepId(String? inepId) => TagTextField(
          label: "ID INEP",
          hint: "Digite o ccódigo INEP",
          onChanged: controller.setInepId,
          value: inepId,
          validator: requiredValidator,
        );

    Widget bfParticipatorCheck({bool? bfParticipator}) => Row(
          children: [
            Checkbox(
              value: bfParticipator ?? false,
              onChanged: (value) => controller.setBfParticipator(value: value!),
            ),
            const TagLabel("Partiipante do programa bolsa familia"),
          ],
        );

    Widget posCensoCheck({bool? posCenso}) => Row(
          children: [
            Checkbox(
              value: posCenso ?? false,
              onChanged: (value) => {},
            ),
            const TagLabel("Pós censo"),
          ],
        );

    return BlocBuilder<EnrollmentSocialBloc, EnrollmentSocialState>(
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
                    RowToColumn(
                      children: [
                        Flexible(child: inputNis(state.nis)),
                        Flexible(child: inputInepId(state.inepId)),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: bfParticipatorCheck(
                            bfParticipator: state.bfParticipator,
                          ),
                        ),
                        Flexible(
                          child: posCensoCheck(posCenso: state.posCenso),
                        ),
                      ],
                    ),
                    SubmitButtonsRow(
                      onSubmitAndGo: () {
                        controller.submitSocialForm(widget.editMode);
                      },
                      onSubmitAndStay: () {
                        controller.submitSocialForm(widget.editMode);
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
