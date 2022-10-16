import 'package:flutter/material.dart';

class SchoolEducationalDataTab extends StatelessWidget {
  const SchoolEducationalDataTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerEducationalData = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerEducationalData,
      child: SingleChildScrollView(
        controller: _controllerEducationalData,
        child: Column(),
      ),
    );
  }
}
