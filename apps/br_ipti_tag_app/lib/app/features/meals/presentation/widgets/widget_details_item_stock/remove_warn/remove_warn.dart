import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/confirmation_remove_warn/confirmation_remove_warn.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/removed_warn/removed_warn.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class RemoveWarn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        children: [
          const Text("Este item pode estar em falta.", style: TextStyle(color: TagColors.colorOrangeNormal, fontWeight: FontWeight.w500),),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 36.0, right: 36.0, bottom: 8.0),
            child: Text(
                "Alguém avisou que este ingrediente está em falta. Acredita ser um engano?", style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          TagButton(text: "Remover aviso de falta", onPressed: () async {
                      final success = await showDialog(
                        context: context,
                        builder: (_) {
                          return ConfirmationRemoveWarn();
                        },
                      );
                    }, buttonStyle: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: TagColors.colorOrangeNormal,
                  padding: TagSpancing.paddingButtonNormal,
                  minimumSize: const Size(256, TagSizes.heightButtonNormal),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        TagBorderRadiusValues.borderRadiusNormal,
                      ),
                    ),
                  ),
                ),),
        ],
      ),
    );
  }
}
