// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FilterStockDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const foodGroup = <FoodGroup>[FoodGroup(name: "name")];

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
              TagDropdownField<FoodGroup>(
                onChanged: (E) => {},
                label: "Grupo de alimentos",
                items: Map.fromEntries(
                  foodGroup.map(
                    (e) => MapEntry(e, e.name),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Filtrar por tipo alimento",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 4.0, top: 4.0, bottom: 4.0,),
                          child:
                              TagButton(text: "Perecível", onPressed: () => {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TagButton(
                              text: "Não-perecível", onPressed: () => {},),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 32.0),
                      child: TagButton(text: "Congelados", onPressed: () => {}),
                    ),
                  ],
                ),
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
                textStyle: const TextStyle(color: TagColors.colorBaseInkNormal),
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

class FoodGroup {
  const FoodGroup({
    required this.name,
  });

  final String name;
}
