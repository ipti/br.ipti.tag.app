import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/confirmation_update_ingredient/confirmation_update_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class UpdateIngredientDialog extends StatefulWidget {
  @override
  State<UpdateIngredientDialog> createState() => _UpdateIngredientDialog();
}

class _UpdateIngredientDialog extends State<UpdateIngredientDialog> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Confirmar Alteração",
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
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    Text("Deseja mesmo alterar a refeição?"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comida",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("data"),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Movim."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Text("Item"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Container(
                  height: 1,
                  color: TagColors.colorBaseInkLight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: const [
                    Text(
                      "Remover",
                      style: TextStyle(
                        color: TagColors.colorRedDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text("Leite de vaca"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: const [
                    Text(
                      "Adicionar",
                      style: TextStyle(
                        color: TagColors.colorGreenLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text("Leite de vaca"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              TagButton(
                text: "Alterar refeição",
                onPressed: () async {
                  Navigator.pop(context, false);
                  final success = await showDialog(
                    context: context,
                    builder: (_) {
                      return ConfirmationUpdateIngredient();
                    },
                  );
                },
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
