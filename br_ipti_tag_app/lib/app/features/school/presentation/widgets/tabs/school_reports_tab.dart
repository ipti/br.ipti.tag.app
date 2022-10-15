import 'package:flutter/material.dart';

class SchoolReportsTab extends StatelessWidget {
  const SchoolReportsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerReports = ScrollController();
    return Scrollbar(
      isAlwaysShown: true,
      controller: _controllerReports,
      child: SingleChildScrollView(
        controller: _controllerReports,
        child: Column(),
      ),
    );
  }
}
