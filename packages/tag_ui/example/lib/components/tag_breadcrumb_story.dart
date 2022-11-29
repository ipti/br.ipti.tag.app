import 'package:flutter/src/widgets/basic.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent breadcrumb() => WidgetbookComponent(
      name: 'Tag_Breadcrumb',
      useCases: [
        WidgetbookUseCase(
            name: 'Breadcrumb',
            builder: (context) {
              return Center(
                child: TagBreadcrumb(
                  onTapDefault: (route) {
                    // Modular.to.pushNamed(route, forRoot: true);
                  },
                  rootItem: "Tag",
                  paths: const [
                    //  AppRoutes.alunos,
                    TagPath("", "Matricula Rápida"),
                  ],
                ),
              );
            }),
      ],
    );
