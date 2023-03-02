import 'package:flutter/material.dart';

class SchoolEducationalDataTab extends StatelessWidget {
  const SchoolEducationalDataTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerEducationalData = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controllerEducationalData,
      child: SingleChildScrollView(
        controller: controllerEducationalData,
        child: Column(),
      ),
    );
  }
}
