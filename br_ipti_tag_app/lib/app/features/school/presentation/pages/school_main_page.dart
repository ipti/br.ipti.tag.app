import 'package:br_ipti_tag_app/app/shared/widgets/header/header_desktop.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolMainPage extends StatefulWidget {
  const SchoolMainPage({Key? key, this.title = 'Escolas'}) : super(key: key);

  final String title;
  @override
  _SchoolMainPageState createState() => _SchoolMainPageState();
}

class _SchoolMainPageState extends State<SchoolMainPage> {
  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      header: const HeaderDesktop(),
      aside: Container(),
      title: widget.title,
      description: "Visualize e edite os dados cadastrais da escola",
      path: [widget.title],
      body: <Widget>[
        Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SelectActionNavigatorItem(
                title: "Visualizar dados cadastrais",
                subtitle: "Visualizar dados cadastrais da escola",
                onTap: () {
                  Modular.to.pushNamed("informacoes");
                },
              ),
              _SelectActionNavigatorItem(
                title: "Editar dados cadastrais",
                subtitle: "Editar dados cadastrais da escola",
                onTap: () {
                  Modular.to.pushNamed("editar");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SelectActionNavigatorItem extends StatelessWidget {
  const _SelectActionNavigatorItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final Function onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    const textStyleTitleCard = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: TagColors.colorBaseInkNormal,
    );
    return TagBox(
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.all(24),
        dense: true,
        horizontalTitleGap: 4,
        title: Text(
          title,
          style: textStyleTitleCard,
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: TagColors.colorBaseBlueNormal,
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
