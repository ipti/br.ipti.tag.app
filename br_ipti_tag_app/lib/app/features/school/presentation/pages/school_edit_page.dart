import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_adress_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_educational_data_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_equipments_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_id_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_structure_tab.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolEditPage extends StatefulWidget {
  const SchoolEditPage({Key? key, this.title = "Escola"}) : super(key: key);

  final String title;
  @override
  SchoolEditPageState createState() => SchoolEditPageState();
}

class SchoolEditPageState extends ModularState<SchoolEditPage, SchoolCubit> {
  @override
  void initState() {
    controller.fetchCurrentSchoolData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    const List<Tab> tabs = [
      Tab(
        child: Text("Identificação"),
      ),
      Tab(
        child: Text("Endereço e contato"),
      ),
      Tab(
        child: Text("Estrutura"),
      ),
      Tab(
        child: Text("Equipamentos"),
      ),
      Tab(
        child: Text("Dados educacionais"),
      ),
      // Tab(
      //   child: Text("Relatórios"),
      // ),
    ];

    final buttonSubmit = TagButton(
      text: "Salvar informações",
      onPressed: () => _save(),
    );

    return DefaultTabController(
      length: tabs.length,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        // header: const HeaderDesktop(),
        aside: Container(),
        title: widget.title,
        description: 'Edite as informações da sua escola',
        path: [],
        body: <Widget>[
          const TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseInkLight,
            labelStyle: TagTextStyles.textTabBarLabel,
            unselectedLabelColor: TagColors.colorBaseInkLight,
            unselectedLabelStyle: TagTextStyles.textTabBarLabelUnselected,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: tabs,
          ),
          const SizedBox(
            height: 250,
            child: TabBarView(children: [
              SchoolIdTab(),
              SchoolAddressTab(),
              SchoolStructureTab(),
              ShcoolEquipmentsTab(),
              SchoolEducationalDataTab(),
              // SchoolReportsTab(),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RowToColumn(children: [
                Flexible(child: withPadding(buttonSubmit)),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  void _save() {
    const snackBar = SnackBar(
      content: Text('Enviando dados'),
      backgroundColor: TagColors.colorBaseBlueNormal,
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // controller.updateSchoolData();
  }
}
