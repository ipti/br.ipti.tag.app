import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class CreatePlan extends StatefulWidget {
  const CreatePlan({super.key});

  @override
  State<CreatePlan> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {
  late int cont = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      const styleText = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,);

    return Column(
      children: [
        Container(height: 1, color: TagColors.colorBaseCloudDark),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TagTextField(label: "Objetivo"),
              const TagTextField(label: "Tipo"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: TagDropdownField(
                      onChanged: (e) => {},
                      label: 'Recurso(s)',
                      padding: const EdgeInsets.all(5),
                      items: Map.fromEntries(
                        ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                          (e) => MapEntry(e, e),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(cont.toString(), style: styleText,),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle light when tapped.
                              cont++;
                            });
                          },
                          child: Container(
                            color: TagColors.colorBaseCloudLight,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Container(
                  width: size.width * 1,
                  child: TagButton(
                    text: "Salvar informações",
                    onPressed: () => {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
