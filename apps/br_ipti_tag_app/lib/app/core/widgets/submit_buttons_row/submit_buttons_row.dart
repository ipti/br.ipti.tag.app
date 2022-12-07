import 'package:flutter/widgets.dart';
import 'package:tag_ui/tag_ui.dart';

class SubmitButtonsRow extends StatelessWidget {
  const SubmitButtonsRow({
    super.key,
    required this.onSubmitAndGo,
    required this.onSubmitAndStay,
  });

  final dynamic Function() onSubmitAndGo;
  final dynamic Function() onSubmitAndStay;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return RowToColumn(
      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: isDesktop ? FlexFit.loose : FlexFit.tight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: TagButton(
              text: "Salvar informações",
              onPressed: onSubmitAndStay,
            ),
          ),
        ),
        Flexible(
          fit: isDesktop ? FlexFit.loose : FlexFit.tight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: TagButton(
              backgroundColor: TagColors.colorBaseCloudNormal,
              textButtonColor: TagColors.colorBaseInkNormal,
              text: "Salvar informações e avançar",
              onPressed: onSubmitAndGo,
            ),
          ),
        ),
      ],
    );
  }
}
