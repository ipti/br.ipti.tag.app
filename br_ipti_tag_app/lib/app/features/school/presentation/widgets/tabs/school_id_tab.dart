import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_admin_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_basic_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_bodies_affiliated_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_body_regulation_sphere_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_others_data_form.dart';
import 'package:flutter/material.dart';

class SchoolIdTab extends StatefulWidget {
  const SchoolIdTab({
    super.key,
  });

  @override
  State<SchoolIdTab> createState() => _SchoolIdTabState();
}

class _SchoolIdTabState extends State<SchoolIdTab> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _controllerId = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: _controllerId,
      child: SingleChildScrollView(
        controller: _controllerId,
        child: Column(
          children: const <Widget>[
            SchoolBasicDataForm(),
            SchoolAdminDataForm(),
            SchoolBodiesAffiliatedDataForm(),
            SchoolBodyRegulationSphereDataForm(),
            SchoolOthersDataForm()
          ],
        ),
      ),
    );
  }
}
