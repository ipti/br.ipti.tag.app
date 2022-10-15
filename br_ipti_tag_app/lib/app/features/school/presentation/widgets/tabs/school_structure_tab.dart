import 'package:flutter/material.dart';

class SchoolStructureTab extends StatelessWidget {
  const SchoolStructureTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerStructure = ScrollController();
    return Scrollbar(
      isAlwaysShown: true,
      controller: _controllerStructure,
      child: SingleChildScrollView(
        controller: _controllerStructure,
        child: Column(),
      ),
    );
  }
}
