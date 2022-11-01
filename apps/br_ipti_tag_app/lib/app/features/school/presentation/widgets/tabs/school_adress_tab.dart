import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_adress_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_contact_data_form.dart';
import 'package:flutter/material.dart';

class SchoolAddressTab extends StatelessWidget {
  const SchoolAddressTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerAddress = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerAddress,
      child: SingleChildScrollView(
        controller: _controllerAddress,
        child: Column(
          children: const <Widget>[
            SchoolAdressDataForm(),
            SchoolContactDataForm(),
          ],
        ),
      ),
    );
  }
}
