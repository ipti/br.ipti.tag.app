import 'package:flutter/material.dart';

class ShcoolEquipmentsTab extends StatelessWidget {
  const ShcoolEquipmentsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerEquipments = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerEquipments,
      child: SingleChildScrollView(
        controller: _controllerEquipments,
        child: Column(),
      ),
    );
  }
}
