import 'package:flutter/widgets.dart';
import 'package:tag_ui/tag_ui.dart';

class SubmitButtonsRow extends StatelessWidget {
  const SubmitButtonsRow({
    Key? key,
    required this.onSubmitAndGo,
    required this.onSubmitAndStay,
  }) : super(key: key);

  final dynamic Function() onSubmitAndGo;
  final dynamic Function() onSubmitAndStay;

  @override
  Widget build(BuildContext context) {
    return RowToColumn(
      children: [
        Flexible(
          child: TagButton(
            text: "Salvar informações",
            onPressed: onSubmitAndStay,
          ),
        ),
        Flexible(
          child: TagButton(
            backgroundColor: TagColors.colorBaseCloudNormal,
            textButtonColor: TagColors.colorBaseInkNormal,
            text: "Salvar informações e avançar",
            onPressed: onSubmitAndGo,
          ),
        ),
      ],
    );
  }
}
