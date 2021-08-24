import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'bloc/create_item_stock_bloc.dart';
import 'bloc/create_item_stock_events.dart';

class CreateItemStockPage extends StatefulWidget {
  final String title;
  const CreateItemStockPage({Key key, this.title = 'Matrícula rápida'})
      : super(key: key);
  @override
  CreateItemStockPageState createState() => CreateItemStockPageState();
}

class CreateItemStockPageState
    extends ModularState<CreateItemStockPage, CreateItemStockBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: MainLayoutAdaptativy(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TagBreadcrumb(
                        rootItem: "Tag",
                        paths: const ["Alunos", "Matricula Rápida"],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Heading(
                      text: widget.title,
                      type: HeadingType.Title1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis orci ligula, a viverra augue semper in. Quisque vulputate lobortis feugiat.",
                      style: TextStyle(
                        color: TagColors.colorTextSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      labelColor: TagColors.colorTabIndicator,
                      indicatorColor: TagColors.colorTabIndicator,
                      onTap: controller.tabNavigation,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      tabs: const [
                        Tab(
                          child: Text("Dados do aluno"),
                        ),
                        Tab(
                          child: Text("Endereço"),
                        ),
                        Tab(
                          child: Text("Turma"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RouterOutlet(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
