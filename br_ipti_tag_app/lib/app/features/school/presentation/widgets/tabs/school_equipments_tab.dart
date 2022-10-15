import 'package:flutter/material.dart';

class ShcoolEquipmentsTab extends StatelessWidget {
  const ShcoolEquipmentsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerEquipments = ScrollController();
    return Scrollbar(
      isAlwaysShown: true,
      controller: _controllerEquipments,
      child: SingleChildScrollView(
        controller: _controllerEquipments,
        child: Column(),
      ),
    );
  }
}
