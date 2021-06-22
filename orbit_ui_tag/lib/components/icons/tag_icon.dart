import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

class TagIcon extends StatelessWidget {
  const TagIcon({Key key, this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: TagSizes.heightIconLarge,
        maxWidth: TagSizes.widthIconLarge,
        minHeight: TagSizes.heightIconSmall,
        minWidth: TagSizes.widthIconSmall,
      ),
      child: SvgPicture.asset(
        path,
        package: "orbit_ui_tag",
      ),
    );
  }
}
