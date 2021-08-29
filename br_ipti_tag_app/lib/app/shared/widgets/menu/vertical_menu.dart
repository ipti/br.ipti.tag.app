import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

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
        onTap: (route) {
          Modular.to.navigate(route);
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
        onTap: (route) {
          Modular.to.navigate(route);
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
        onTap: (route) {
          Modular.to.navigate(route);
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
        onTap: (route) {
          Modular.to.navigate(route);
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
        onTap: (route) {
          Modular.to.navigate(route);
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
                  color: Color(0xFF667DF4),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFFF45A5A),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFF66D654),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFFEADA48),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
