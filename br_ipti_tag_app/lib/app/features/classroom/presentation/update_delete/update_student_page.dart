import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tagbutton_icon.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/material.dart';

class ClassroomStudentPage extends StatelessWidget {
  const ClassroomStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flexible(
        child: Row(
          children: const [
            TagButtonIcon(
              icon: FilePaths.ICON_PERSONS_BLUE_SVG,
              label: 'label',
            )
          ],
        ),
      ),
    );
  }
}
