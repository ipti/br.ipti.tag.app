import 'package:br_ipti_tag_app/app/shared/widgets/templates/main_layout_adaptativy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class TagBasicDesktopLayout extends StatelessWidget {
  final String title;
  final List<String> path;
  final String description;
  final List<Widget> body;

  const TagBasicDesktopLayout({
    Key key,
    @required this.title,
    @required this.path,
    @required this.description,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayoutAdaptativy(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: TagBreadcrumb(
                      rootItem: "Tag",
                      paths: path,
                    ),
                  ),
                  Heading(
                    text: title,
                    type: HeadingType.Title1,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: TagColors.colorTextSecondary,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  ...body
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
