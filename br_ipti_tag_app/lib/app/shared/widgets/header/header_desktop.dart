import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  final sessionController = Modular.get<SessionBloc>();

  @override
  void initState() {
    sessionController.fetchSchools();
    sessionController.fetchCurrentSchool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: BlocBuilder<SessionBloc, SessionState>(
                    bloc: sessionController,
                    builder: (context, state) {
                      final schools = state.schools ?? [];
                      return TagDropdownField<School>(
                        label: "",
                        value: state.currentSchool,
                        onChanged: (school) => sessionController.changeSchool(
                          school,
                        ),
                        items: Map.fromEntries(schools.map(
                          (e) => MapEntry(e, e.name!),
                        )),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
