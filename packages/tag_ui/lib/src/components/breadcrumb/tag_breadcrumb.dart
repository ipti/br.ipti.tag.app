import 'package:flutter/material.dart';
import 'package:tag_ui/src/components/shared/path.dart';

import 'tag_breadcrumb_item.dart';

class TagBreadcrumb extends StatelessWidget {
  const TagBreadcrumb({
    super.key,
    this.rootItem,
    required this.paths,
    required this.onTapDefault,
  });

  final String? rootItem;
  final List<TagPath> paths;
  final void Function(String route) onTapDefault;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: paths.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          child: const Icon(
            Icons.chevron_right,
            size: 18,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.centerLeft,
          child: TagBreadcrumbItem(
            title: paths[index].label,
            isLast: paths.length - 1 == index,
            action: () {
              if (paths[index].path.isNotEmpty) onTapDefault(paths[index].path);
            },
          ),
        );
      },
    );
  }
}
