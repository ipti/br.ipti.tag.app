import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FilterMenuDialog extends StatefulWidget {
  @override
  State<FilterMenuDialog> createState() => _FilterMenuDialogState();
}

class _FilterMenuDialogState extends State<FilterMenuDialog> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Mostrar turnos",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, top: 4.0, bottom: 4.0),
                        child: TagButton(text: "Manhã", onPressed: () => {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TagButton(text: "Tarde", onPressed: () => {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TagButton(text: "Noite", onPressed: () => {}),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filtrar tipo de aluno",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, top: 4.0, bottom: 4.0),
                        child: TagButton(text: "Creche", onPressed: () => {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TagButton(text: "EJA", onPressed: () => {}),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
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
