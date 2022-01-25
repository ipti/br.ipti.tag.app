import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/components/components.dart';
import 'package:tag_ui/design_tokens/colors.dart';

class AddTeacherDialog extends StatefulWidget {
  const AddTeacherDialog({Key? key}) : super(key: key);

  @override
  State<AddTeacherDialog> createState() => _AddTeacherDialogState();
}

class _AddTeacherDialogState extends State<AddTeacherDialog> {
  final int professorDropDownValue = 0;

  final int disciplineDropDownValue = 0;

  final int cargoDropDownValue = 0;

  final int tipoContratoDropDownValue = 0;
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 17,
                right: 12,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    FilePaths.ICON_CLOSE_SVG,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 10,
              color: TagColors.colorBaseProductDark,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'Carlos Da Silva Químico',
                },
                hint: 'Selecione',
                onChanged: () => professorDropDownValue,
                label: 'Professor',
                value: professorDropDownValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'Química',
                },
                hint: 'Selecione',
                onChanged: () => disciplineDropDownValue,
                label: 'Disciplinas',
                value: disciplineDropDownValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'Professor titular',
                },
                hint: 'Selecione',
                onChanged: () => cargoDropDownValue,
                label: 'Cargo',
                value: cargoDropDownValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TagDropdownField(
                items: const <int, String>{
                  0: 'CLT',
                },
                hint: 'Selecione',
                onChanged: () => tipoContratoDropDownValue,
                label: 'Cargo',
                value: tipoContratoDropDownValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 18,
                bottom: 18,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TagButton(
                    text: 'Adicionar',
                    onPressed: () {
                      debugPrint('adicionado');
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TagButton(
                    text: 'Cancelar',
                    onPressed: () {
                      debugPrint('cancelado');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
