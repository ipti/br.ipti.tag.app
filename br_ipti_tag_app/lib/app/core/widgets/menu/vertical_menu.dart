import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/core/strings/file_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class TagVerticalMenu extends StatelessWidget {
  const TagVerticalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;
    final items = [
      TagMenuItem(
        title: "Escola",
        route: '/escola/',
        isActive: currentRoute!.contains('/escola/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_HOME_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_HOME_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Turmas",
        route: '/turmas/',
        isActive: currentRoute.contains('/turmas/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Alunos",
        route: '/alunos/',
        isActive: currentRoute.contains('/alunos/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Professores",
        route: '/professores/',
        isActive: currentRoute.contains('/professores/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Frequencia",
        route: '/frequencia/',
        isActive: currentRoute.contains('/frequencia/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_TRUCK_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_TRUCK_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Merenda",
        route: '/merenda/',
        isActive: currentRoute.contains('/merenda/'),
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.popAndPushNamed(routeName);
        },
      ),
      TagMenuItem(
        title: "Logout",
        route: '/logout/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
        onTap: (String routeName) {
          final sessionService = Modular.get<SessionService>();
          sessionService.cleanToken();
          sessionService.cleanSchoolYear();
          sessionService.cleanCurrentUserSchools();
          Modular.to.popAndPushNamed("/");
        },
      ),
    ];

    return TagMenu(
      items: items,
    );
  }
}
