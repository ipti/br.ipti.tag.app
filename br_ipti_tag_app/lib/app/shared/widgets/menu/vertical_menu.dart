import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

class TagVerticalMenu extends StatelessWidget {
  const TagVerticalMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;
    final items = [
      TagMenuItem(
        title: "Turmas",
        route: '/turmas',
        isActive: currentRoute == '/turmas/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.navigate(routeName);
        },
      ),
      TagMenuItem(
        title: "Alunos",
        route: '/alunos',
        isActive: currentRoute == '/alunos/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.navigate(routeName);
        },
      ),
      TagMenuItem(
        title: "Professores",
        route: '/teacher',
        isActive: currentRoute == '/teacher/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.navigate(routeName);
        },
      ),
      TagMenuItem(
        title: "Transporte",
        route: '/transporte',
        isActive: currentRoute == '/transporte/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_TRUCK_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_TRUCK_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.navigate(routeName);
        },
      ),
      TagMenuItem(
        title: "Merenda",
        route: '/merenda',
        isActive: currentRoute == '/merenda/',
        icon: TagIcon(
          defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
          disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
        ),
        onTap: (String routeName) {
          Modular.to.navigate(routeName);
        },
      ),
    ];

    return Stack(
      children: [
        TagMenu(
            initialRoute: ModalRoute.of(context).settings.name, items: items),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  height: 4,
                  color: const Color(0xFF667DF4),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: const Color(0xFFF45A5A),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: const Color(0xFF66D654),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: const Color(0xFFEADA48),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
