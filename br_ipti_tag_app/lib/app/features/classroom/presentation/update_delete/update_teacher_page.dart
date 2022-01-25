import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/add_teacher_dialog.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class ClassroomTeacherPage extends StatelessWidget {
  const ClassroomTeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RowToColumn(
        children: [
          TagButtonIcon(
            buttonStyle: ElevatedButton.styleFrom(
              elevation: 0,
              primary: TagColors.colorBaseProductNormal,
              padding: TagSpancing.paddingButtonNormal,
              minimumSize: const Size(40, TagSizes.heightButtonNormal),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    TagBorderRadiusValues.borderRadiusNormal,
                  ),
                ),
              ),
            ),
            label: 'Adicionar professor por disciplina',
            onPressed: () async => showDialog(
                context: context,
                builder: (context) {
                  return const AddTeacherDialog();
                }),
            icon: FilePaths.INFO_ICON_SVG,
            textStyle: const TextStyle(color: TagColors.colorBaseWhiteNormal),
          ),
        ],
      ),
    );
  }
}
