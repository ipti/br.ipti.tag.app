import 'package:flutter/material.dart';

class ShcoolEquipmentsTab extends StatelessWidget {
  const ShcoolEquipmentsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerEquipments = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controllerEquipments,
      child: SingleChildScrollView(
        controller: controllerEquipments,
        child: Column(),
      ),
    );
  }
}
