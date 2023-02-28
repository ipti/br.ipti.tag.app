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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Filtros",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context, false),
                    icon: const Icon(Icons.close),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Mostrar turnos"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
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
            const SizedBox(height: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Filtrar tipo de aluno"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TagButton(text: "Creche", onPressed: () => {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TagButton(text: "EJA", onPressed: () => {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                          TagButton(text: "Fundamental", onPressed: () => {}),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32,),
            TagButton(text: "Aplicar filtros", onPressed: () => {}),
            const SizedBox(height: 8,),
            TagButton(text: "Limpar filtros", onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
