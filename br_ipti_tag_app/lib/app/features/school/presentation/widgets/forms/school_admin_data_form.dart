import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_state.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolAdminDataForm extends StatefulWidget {
  const SchoolAdminDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolAdminDataForm> createState() => _SchoolAdminDataFormState();
}

class _SchoolAdminDataFormState extends State<SchoolAdminDataForm> {
  final controller = Modular.get<SchoolCubit>();

  @override
  Widget build(BuildContext context) {
    const heading = Heading(text: "Dados do gestor", type: HeadingType.Title2);
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputManagerName(String adminName) => TagTextField(
          label: "Nome completo",
          hint: "Digite o nome completo do gestor",
          inputType: TextInputType.name,
          validator: requiredValidator,
          value: adminName,
          onChanged: controller.setCurrentSchoolManagerName,
        );
    Widget inputManagerCpf(String adminCpf) => TagTextField(
          label: "CPF",
          hint: "Digite o CPF do gestor",
          validator: requiredValidator,
          value: adminCpf,
          onChanged: controller.setCurrentSchoolManagerCpf,
        );
    Widget inputManagerMail(String adminMail) => TagTextField(
          label: "E-mail",
          hint: "Digite o e-mail do gestor",
          validator: requiredValidator,
          value: adminMail,
          onChanged: controller.setCurrentSchoolManagerMail,
        );
    Widget inputManagerRole() => TagDropdownField(
          label: "Cargo",
          validator: requiredValidator,
          items: {},
          onChanged: controller.setCurrentSchoolManagerRole,
        );
    Widget inputManagerContract() => TagDropdownField(
          label: "Tipo de contrato",
          validator: requiredValidator,
          items: {},
          onChanged: controller.setCurrentSchoolManagerContract,
        );
    Widget inputManagerAccessControl(String adminAccessContro) => TagTextField(
          label: "Especificação do Critério de Acesso",
          hint: "Digite o valor",
          validator: requiredValidator,
          value: adminAccessContro,
        );

    return BlocBuilder<SchoolCubit, SchoolState>(
      bloc: controller,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            withPadding(heading),
            RowToColumn(children: [
              Flexible(
                child: withPadding(inputManagerName(
                    controller.state.currentSchoolData?.managerName ?? "")),
              ),
              Flexible(
                child: withPadding(inputManagerCpf(
                    controller.state.currentSchoolData?.managerCpf ?? "")),
              ),
            ]),
            RowToColumn(children: [
              Flexible(
                child: withPadding(inputManagerMail(
                    controller.state.currentSchoolData?.managerEmail ?? "")),
              ),
              // Flexible(
              //   child: withPadding(inputManagerRole()),
              // ),
            ]),
            RowToColumn(children: [
              // Flexible(
              //   child: withPadding(inputManagerContract()),
              // ),
              Flexible(
                  child: withPadding(inputManagerAccessControl(controller
                          .state.currentSchoolData?.managerAccessCriterion ??
                      "")))
            ]),
          ],
        );
      },
    );
  }
}
