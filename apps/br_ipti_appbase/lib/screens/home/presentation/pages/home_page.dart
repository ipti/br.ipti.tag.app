import 'package:br_ipti_appbase/core/status_page.dart';
import 'package:br_ipti_appbase/core/util/routes/routes.dart';
import 'package:br_ipti_appbase/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_appbase/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_appbase/screens/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import '../cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.title = "Inicio",
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: "Bem Vinda(o)!",
      path: const [
        AppRoutes.home,
      ],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      description: "",
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: BlocBuilder<HomeCubit, HomeState>(
              bloc: controller,
              builder: (context, state) {
                switch (state.status) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    return TagDataTable(
                      onTapRow: (index) => Modular.to.pushNamed(
                        "updatePage",
                        arguments: state.students[index],
                      ),
                      columns: const [
                        DataColumn(
                          label: Text("Nome"),
                        ),
                      ],
                      source: StudentsDatatable(
                        data: state.students,
                      ),
                    );
                  default:
                    return TableCalendar(
                      locale: 'pt_BR',
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      // headerVisible: false
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      daysOfWeekVisible: false,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudentsDatatable extends DataTableSource {
  StudentsDatatable({
    required this.data,
  });

  final List<StudentIdentification> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        data[index].name,
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
