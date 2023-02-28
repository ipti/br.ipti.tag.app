import 'package:flutter/material.dart';

class SchoolStructureTab extends StatelessWidget {
  const SchoolStructureTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerStructure = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controllerStructure,
      child: SingleChildScrollView(
        controller: controllerStructure,
        child: Column(),
      ),
    );
  }
}
