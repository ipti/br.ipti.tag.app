import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/remove_warn/remove_warn.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/removed_warn/removed_warn.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class ConfirmationRemoveWarn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Remover aviso de falta",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context, false),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Column(
                  children: const [
                    Text(
                        "Deseja mesmo avisar que o ingrediente abaixo tem itens no estoque?"),
                  ],
                ),
              ),
                Row(
                children: const [
                  Text(
                    "Ingrediente ",
                    style: TextStyle(
                        color: TagColors.colorBaseInkLight,
                        fontWeight: FontWeight.w500,),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: TagColors.colorBaseInkNormal,
                        fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 32.0),
                child: TagButton(
                  text: "Remover aviso de falta no estoque",
                  onPressed: () async {
                        Navigator.pop(context, false); 
                        final success = await showDialog(
                          context: context,
                          builder: (_) {
                            return RemovedWarn();
                          },
                        );
                      },
                  buttonStyle: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: TagColors.colorRedDark,
                    padding: TagSpancing.paddingButtonNormal,
                    minimumSize: const Size(256, TagSizes.heightButtonNormal),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          TagBorderRadiusValues.borderRadiusNormal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TagButton(
                text: "Voltar",
                textStyle: TextStyle(color: TagColors.colorBaseInkNormal),
                onPressed: () => Navigator.pop(context, false),
                buttonStyle: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: TagColors.colorBaseProductLightActive,
                  padding: TagSpancing.paddingButtonNormal,
                  minimumSize: const Size(256, TagSizes.heightButtonNormal),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        TagBorderRadiusValues.borderRadiusNormal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}