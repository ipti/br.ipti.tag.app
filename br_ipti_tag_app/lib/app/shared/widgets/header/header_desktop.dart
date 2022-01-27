import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/components/components.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  final schoolsNotifier = ValueNotifier<List<School>>([]);
  final currentSchoolNotifier = ValueNotifier<School>(School());
  final sessionService = Modular.get<SessionService>();

  @override
  void initState() {
    sessionService
        .getCurrentUserSchools()
        .then((schools) => schoolsNotifier.value = schools);

    sessionService
        .getCurrentSchool()
        .then((school) => currentSchoolNotifier.value = school);

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
                child: ValueListenableBuilder<List<School>>(
                  valueListenable: schoolsNotifier,
                  builder: (context, schools, _) {
                    if (schools.isEmpty) return Container();
                    return ValueListenableBuilder<School>(
                        valueListenable: currentSchoolNotifier,
                        builder: (context, school, _) {
                          return TagDropdownField<School>(
                            label: "",
                            value: school,
                            onChanged: (school) =>
                                sessionService.setCurrentSchool(
                              school,
                            ),
                            items: Map.fromEntries(
                                schools.map((e) => MapEntry(e, e.name!))),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
