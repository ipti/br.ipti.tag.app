import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit_ui_tag/design_tokens/sizes.dart';

class LogoTag extends StatelessWidget {
  const LogoTag({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: TagSizes.heightServiceLogoSmall),
      child: SvgPicture.asset(
        FilePaths.LOGO_PATH_SVG,
        semanticsLabel: 'TAG Logo',
        color: color,
      ),
    );
  }
}
