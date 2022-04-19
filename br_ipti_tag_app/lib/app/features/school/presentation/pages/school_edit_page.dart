import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_adress_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_educational_data_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_equipments_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_id_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_reports_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_structure_tab.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolEditPage extends StatefulWidget {
  const SchoolEditPage({Key? key, this.title = "Escola"}) : super(key: key);

  final String title;
  @override
  _SchoolEditPageState createState() => _SchoolEditPageState();
}

class _SchoolEditPageState extends State<SchoolEditPage> {
  @override
  Widget build(BuildContext context) {
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
      Tab(
        child: Text("Relatórios"),
      ),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        // header: const HeaderDesktop(),
        aside: Container(),
        title: widget.title,
        description: 'Edite as informações da sua escola',
        path: [],
        body: const <Widget>[
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: tabs,
          ),
          SizedBox(
            height: 300.0,
            child: TabBarView(children: [
              SchoolIdTab(),
              SchoolAddressTab(),
              SchoolStructureTab(),
              ShcoolEquipmentsTab(),
              SchoolEducationalDataTab(),
              SchoolReportsTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
