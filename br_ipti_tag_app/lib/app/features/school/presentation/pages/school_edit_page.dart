import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_adress_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_educational_data_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_equipments_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_id_tab.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/widgets/tabs/school_reports_tab.dart';
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
      Tab(
        child: Text("Relatórios"),
      ),
    ];

    final buttonSubmitAndGo = TagButton(
      text: "Salvar informações",
      onPressed: () => _save(),
    );
    final buttonSubmitAndStay = TagButton(
      text: "Salvar informações e avançar",
      buttonStyle: TagButtonStyles.secondary,
      textStyle: TagTextStyles.textButtonSecondary,
      onPressed: () => _saveAndNext(),
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
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseInkLight,
            labelStyle: TagTextStyles.textTabBarLabel,
            unselectedLabelColor: TagColors.colorBaseInkLight,
            unselectedLabelStyle: TagTextStyles.textTabBarLabelUnselected,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: tabs,
          ),
          SizedBox(
            height: 200.0,
            child: TabBarView(children: [
              SchoolIdTab(),
              SchoolAddressTab(),
              SchoolStructureTab(),
              ShcoolEquipmentsTab(),
              SchoolEducationalDataTab(),
              SchoolReportsTab(),
            ]),
          ),
          RowToColumn(children: [
            Column(
              children: [withPadding(buttonSubmitAndGo)],
            ),
            Flexible(child: withPadding(buttonSubmitAndStay)),
          ]),
        ],
      ),
    );
  }

  void _save() {
    controller.updateSchoolData();
    print("object1");
  }

  void _saveAndNext() {
    _save();
  }
}
