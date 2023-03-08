import 'dart:developer';

import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/warn_send/warn_send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class WarnToMiss extends StatefulWidget {
  @override
  State<WarnToMiss> createState() => _WarnToMissState();
}

class _WarnToMissState extends State<WarnToMiss> {
  bool other = false;
  void _handleOtherTrue() {
    
    setState(() {other = true;});
  }

  void _handleOtherFalse() {
   
    setState(() { other = false;});
  }

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
                    "Avisar falta",
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
                        "Deseja mesmo avisar que o ingrediente abaixo acabou no estoque?",),
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
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Detalhes",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 4.0, top: 4.0, bottom: 4.0,),
                          child: TagButton(
                              text: "Estragou", onPressed: _handleOtherFalse,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TagButton(
                              text: "Em Falta", onPressed: _handleOtherFalse,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TagButton(
                              text: "Outro", onPressed: _handleOtherTrue,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (other) const TagTextField(label: "Motivo"),
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
                          return WarnSend();
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
              const SizedBox(
                height: 8,
              ),
              TagButton(
                text: "Voltar",
                textStyle: const TextStyle(color: TagColors.colorBaseInkNormal),
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
