import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SelectActionMealsPage extends StatefulWidget {
  const SelectActionMealsPage({super.key, this.title = 'Merenda escolar'});

  final String title;

  @override
  SelectActionMealsPageState createState() => SelectActionMealsPageState();
}

class SelectActionMealsPageState extends State<SelectActionMealsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description:
          "Acompanhe o calendário e o estoque de alimentos da sua escola",
      path: const [],
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SelectActionNavigatorItem(
              title: "Refeições",
              subtitle: "Cardápio semanal da escola",
              onTap: () {
                Modular.to.pushNamed("refeicoes");
              },
            ),
            _SelectActionNavigatorItem(
              title: "Estoque",
              subtitle: "Estoque de alimentos da escola",
              onTap: () {
                Modular.to.pushNamed("estoque");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectActionNavigatorItem extends StatelessWidget {
  const _SelectActionNavigatorItem({
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final Function() onTap;
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
