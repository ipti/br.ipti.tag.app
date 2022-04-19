import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_admin_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_basic_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_bodies_affiliated_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_body_regulation_sphere_data_form.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/forms/school_others_data_form.dart';
import 'package:flutter/material.dart';

class SchoolIdTab extends StatelessWidget {
  const SchoolIdTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          SchoolBasicDataForm(),
          SchoolAdminDataForm(),
          SchoolBodiesAffiliatedDataForm(),
          SchoolBodyRegulationSphereDataForm(),
          SchoolOthersDataForm()
        ],
      ),
    );
  }
}
