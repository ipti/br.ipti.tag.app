import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';
import 'bloc/create_item_stock_bloc.dart';
import 'bloc/create_item_stock_events.dart';

class CreateItemStockPage extends StatefulWidget {
  const CreateItemStockPage({super.key, this.title = 'Matrícula rápida'});

  final String title;

  @override
  CreateItemStockPageState createState() => CreateItemStockPageState();
}

class CreateItemStockPageState extends State<CreateItemStockPage> {
  final controller = Modular.get<CreateItemStockBloc>();
  @override
  void initState() {
    controller.add(
      StartEditing(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: MainLayoutAdaptativy(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TagBreadcrumb(
                        onTapDefault: (route) {
                          Modular.to.pushNamed(route, forRoot: true);
                        },
                        rootItem: "Tag",
                        paths: const [
                          AppRoutes.alunos,
                          TagPath("", "Matricula Rápida"),
                        ],
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
                      """
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Morbi sagittis orci ligula, a viverra augue semper in. 
                        Quisque vulputate lobortis feugiat.
                      """,
                      style: TextStyle(
                        color: TagColors.colorBaseProductLight,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TabBar(
                    isScrollable: true,
                    labelColor: TagColors.colorBaseProductDark,
                    indicatorColor: TagColors.colorBaseProductDark,
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
                  const Expanded(
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