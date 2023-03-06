import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FilterStockDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filtros",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filtrar por tipo alimento",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, top: 4.0, bottom: 4.0),
                        child:
                            TagButton(text: "Perecível", onPressed: () => {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TagButton(
                            text: "Não-perecível", onPressed: () => {}),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 32.0),
                    child: TagButton(text: "Congelados", onPressed: () => {}),
                  ),
                ],
              ),
              TagButton(
                text: "Aplicar filtros",
                onPressed: () => {},
                buttonStyle: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: TagColors.colorBaseProductNormal,
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
              const SizedBox(
                height: 8,
              ),
              TagButton(
                text: "Limpar filtros",
                textStyle: TextStyle(color: TagColors.colorBaseInkNormal),
                onPressed: () => {},
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
