import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class AddAbility extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adicionar Habilidades",
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
                TagDropdownField(
                  onChanged: (e) => {},
                  label: "Campos de atuação",
                  items: Map.fromEntries(
                    ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                      (e) => MapEntry(e, e),
                    ),
                  ),
                ),
                TagDropdownField(
                  onChanged: (e) => {},
                  label: "Práticas de linguagens",
                  items: Map.fromEntries(
                    ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                      (e) => MapEntry(e, e),
                    ),
                  ),
                ),
                TagDropdownField(
                  onChanged: (e) => {},
                  label: "Objetos de conhecimento",
                  items: Map.fromEntries(
                    ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                      (e) => MapEntry(e, e),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Habilidade'),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Container(
                      color: TagColors.colorBaseCloudLightActive,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: const [
                            Text('+'),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("data"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Selecionadas'),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Container(
                      color: TagColors.colorBaseCloudLightActive,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: const [
                            Text('-'),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("data"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
