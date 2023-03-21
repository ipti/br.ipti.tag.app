import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class AddTypeClass extends StatelessWidget {
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
                    "Adicionar Tipo de Aula",
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: TagTextField(label: "Nome*"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: TagTextField(label: "Descrição"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TagButton(text: "Criar", onPressed: (() => {})),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
