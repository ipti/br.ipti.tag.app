import 'package:flutter/material.dart';

class SchoolReportsTab extends StatelessWidget {
  const SchoolReportsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerReports = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerReports,
      child: SingleChildScrollView(
        controller: _controllerReports,
        child: Column(),
      ),
    );
  }
}
