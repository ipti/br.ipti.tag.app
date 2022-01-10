import 'package:flutter/widgets.dart';
import 'package:tag_ui/tag_ui.dart';

class SubmitButtonsRow extends StatelessWidget {
  const SubmitButtonsRow({
    Key? key,
    required this.onSubmitAndGo,
    required this.onSubmitAndStay,
  }) : super(key: key);

  final Function onSubmitAndGo;
  final Function onSubmitAndStay;

  @override
  Widget build(BuildContext context) {
    return RowToColumn(
      children: [
        const Spacer(),
        Flexible(
          child: TagLinkButton(
            text: "Salvar e continuar na página",
            onPressed: onSubmitAndStay,
          ),
        ),
        Flexible(
          child: TagButton(
            text: "Salvar e prosseguir",
            onPressed: onSubmitAndGo,
          ),
        ),
      ],
    );
  }
}
