import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class TagVerticalMenu extends StatelessWidget {
  const TagVerticalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? "/";
    final items = [
      TagMenuItemProps(
        path: AppRoutes.escola,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_HOME_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_HOME_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.turmas,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.alunos,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.professores,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.frequencia,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
        ),
      ),
      // TagMenuItemProps(
      //   path: AppRoutes,
      //   icon: TagIcon(
      //     defaultVersionPath: FilePaths.ICON_TRUCK_BLUE_SVG,
      //     disabledVersionPath: FilePaths.ICON_TRUCK_GREY_SVG,
      //   ),
      // ),
      TagMenuItemProps(
        path: AppRoutes.merenda,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.notes,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
        ),
       ),
       TagMenuItemProps(
        path: AppRoutes.classPlan,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
      ),
      TagMenuItemProps(
        path: AppRoutes.logout,
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
        onTap: (String routeName) {
          final sessionService = Modular.get<SessionService>();
          sessionService.cleanToken();
          sessionService.cleanSchoolYear();
          sessionService.cleanCurrentUserSchools();
          Modular.to.pushNamed("/", forRoot: true);
        },
      ),
    ];

    return TagMenu(
      items: items,
      currentPathMenu: currentRoute,
      onTapDefault: (String routeName) {
        Modular.to.pushNamed(routeName, forRoot: true);
      },
    );
  }
}
