import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class ClassroomStudentPage extends StatelessWidget {
  const ClassroomStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RowToColumn(
        children: [
          TagButtonIcon(
            label: 'Relatório da Matrícula',
            onPressed: () => debugPrint('null'),
            icon: FilePaths.IMPRESSORA_ICON_SVG,
          ),
          const SizedBox(
            width: 16,
            height: 16,
          ),
          TagButtonIcon(
            label: 'Fichas de matricula',
            onPressed: () => debugPrint('null'),
            icon: FilePaths.IMPRESSORA_ICON_SVG,
          ),
          const SizedBox(
            width: 16,
            height: 16,
          ),
          TagButtonIcon(
            label: 'Lista de alunos',
            onPressed: () => debugPrint('null'),
            icon: FilePaths.IMPRESSORA_ICON_SVG,
          ),
          const SizedBox(
            width: 16,
            height: 16,
          ),
          TagButtonIcon(
            label: 'Ata de notas',
            onPressed: () => debugPrint('null'),
            icon: FilePaths.IMPRESSORA_ICON_SVG,
          ),
        ],
      ),
    );
  }
}
