import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class DropdownSelectSchool extends StatefulWidget {
  const DropdownSelectSchool({super.key});

  @override
  State<DropdownSelectSchool> createState() => _DropdownSelectSchoolState();
}

class _DropdownSelectSchoolState extends State<DropdownSelectSchool> {
  final sessionController = Modular.get<SessionBloc>();

  @override
  void initState() {
    sessionController.fetchSchools();
    sessionController.fetchCurrentSchool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: BlocBuilder<SessionBloc, SessionState>(
        bloc: sessionController,
        builder: (context, state) {
          final schools = state.schools ?? [];
          if (schools.isNotEmpty) state = state.copyWith(currentSchool: state.schools?.where((element) => element.inepId == state.currentSchool?.inepId).first);

          return TagDropdownField<AuthSchool>(
            padding: EdgeInsets.zero,
            label: "",
            value: state.currentSchool,
            onChanged: (school) => sessionController.changeSchool(school!),
            items: Map.fromEntries(schools.map((e) => MapEntry(e, e.name))),
          );
        },
      ),
    );
  }
}
