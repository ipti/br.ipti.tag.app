import 'package:flutter/material.dart';

class SchoolReportsTab extends StatelessWidget {
  const SchoolReportsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerReports = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controllerReports,
      child: SingleChildScrollView(
        controller: controllerReports,
        child: Column(),
      ),
    );
  }
}
