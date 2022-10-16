import 'package:flutter/material.dart';

class SchoolStructureTab extends StatelessWidget {
  const SchoolStructureTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerStructure = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerStructure,
      child: SingleChildScrollView(
        controller: _controllerStructure,
        child: Column(),
      ),
    );
  }
}
