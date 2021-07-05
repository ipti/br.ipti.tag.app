import 'package:br_ipti_tag_app/app/shared/widgets/menu/mobile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_events.dart';

class EnrollmentPage extends StatefulWidget {
  final String title;
  const EnrollmentPage({Key key, this.title = 'Matrícula rápida'})
      : super(key: key);
  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    Modular.to.navigate('../personal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: TagBackgroundColors.backgroundBody,
          drawer: TagMobileMenu(),
          // appBar: TagAppBar(),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _LayoutPages(
              left: TagMobileMenu(),
              center: LayoutBuilder(builder: (context, constraint) {
                return SingleChildScrollView(
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
                              rootItem: "Tag",
                              paths: ["Alunos", "Matricula Rápida"],
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis orci ligula, a viverra augue semper in. Quisque vulputate lobortis feugiat.",
                            style: TextStyle(
                              color: TagColors.colorTextSecondary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Container(
                          child: TabBar(
                            isScrollable: true,
                            labelColor: TagColors.colorTabIndicator,
                            indicatorColor: TagColors.colorTabIndicator,
                            onTap: controller.tabNavigation,
                            labelPadding: EdgeInsets.symmetric(horizontal: 8),
                            tabs: [
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _LayoutPages extends StatelessWidget {
  const _LayoutPages({Key key, this.left, this.center, this.right})
      : super(key: key);

  final Widget left;
  final Widget center;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 992;
        return Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (isDesktop) Flexible(flex: 3, child: left ?? Container()),
              Flexible(
                  flex: 12,
                  child: Padding(
                    padding: EdgeInsets.all(isDesktop ? 32 : 0),
                    child: center,
                  )),
              if (isDesktop) Flexible(flex: 3, child: right ?? Container()),
            ],
          ),
        );
      },
    );
  }
}
