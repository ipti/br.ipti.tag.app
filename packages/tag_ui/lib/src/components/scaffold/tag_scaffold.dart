import 'package:flutter/material.dart';
import 'package:tag_ui/src/components/breadcrumb/tag_breadcrumb.dart';
import 'package:tag_ui/src/components/headings/heading.dart';
import 'package:tag_ui/src/components/shared/path.dart';
import 'package:tag_ui/src/components/templates/main_layout_adaptativy.dart';
import 'package:tag_ui/src/design_tokens/colors.dart';

class TagScaffold extends StatelessWidget {
  final String title;
  final List<TagPath> path;
  final void Function(String route)? onTapBreadcrumb;
  final String? description;
  final PreferredSize? appBar;
  final Widget body;
  final Widget menu;
  final Widget? aside;
  final Widget? header;
  //não utilizado
  final SliverPersistentHeaderDelegate? actionsHeader;

  final TabBar? tabBar;

  const TagScaffold({
    super.key,
    required this.title,
    required this.path,
    required this.body,
    required this.menu,
    this.description,
    this.appBar,
    this.aside,
    this.header,
    this.tabBar,
    this.actionsHeader,
    this.onTapBreadcrumb,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayoutAdaptativy(
        appBar: appBar,
        left: menu,
        body: Align(
          alignment: Alignment.topLeft,
          child: LayoutBuilder(builder: (context, contraints) {
            final isDesktop = MediaQuery.of(context).size.width > 992;

            return NestedScrollView(
              body: body,
              physics: ScrollPhysics(
                parent: isDesktop
                    ? PageScrollPhysics()
                    : AlwaysScrollableScrollPhysics(),
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverPersistentHeader(
                  delegate: _SliverHeaderBreadcrumbDelegate(
                    onTapBreadcrumb: onTapBreadcrumb,
                    path: path,
                  ),
                  pinned: isDesktop,
                ),
                SliverPersistentHeader(
                  delegate: _SliverHeaderDelegate(
                    title: title,
                  ),
                  pinned: true,
                ),
                if (tabBar is TabBar)
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(tabBar!),
                    pinned: true,
                  ),
                if (actionsHeader is SliverPersistentHeaderDelegate)
                  SliverPersistentHeader(
                    delegate: actionsHeader!,
                    pinned: true,
                  ),
              ],
            );
          }),
        ),
        right: aside,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.title,
  });

  final String title;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 40;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Heading(
              text: title,
              type: HeadingType.Title1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SliverHeaderBreadcrumbDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderBreadcrumbDelegate({
    required this.path,
    this.onTapBreadcrumb,
  });

  final List<TagPath> path;

  final void Function(String route)? onTapBreadcrumb;
  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TagBreadcrumb(
        onTapDefault: onTapBreadcrumb ?? (route) {},
        rootItem: "Tag",
        paths: path,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverHeaderBreadcrumbDelegate oldDelegate) => false;
}
