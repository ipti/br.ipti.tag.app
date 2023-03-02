import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

// ignore: must_be_immutable
class TagIcon extends StatefulWidget {
  TagIcon({
    super.key,
    required this.defaultVersionPath,
    required this.disabledVersionPath,
    this.disabled = false,
    this.maxHeight = TagSizes.heightIconLarge,
    this.maxWidth = TagSizes.widthIconLarge,
    this.minHeight = TagSizes.heightIconSmall,
    this.minWidth = TagSizes.widthIconSmall,
  });

  final String defaultVersionPath;
  final String disabledVersionPath;
  bool disabled;
  final double maxHeight;
  final double maxWidth;
  final double minHeight;
  final double minWidth;

  @override
  _TagIconState createState() => _TagIconState();
}

class _TagIconState extends State<TagIcon> {
  @override
  Widget build(BuildContext context) {
    final path = widget.disabled
        ? widget.disabledVersionPath
        : widget.defaultVersionPath;

    return Container(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight,
        maxWidth: widget.maxWidth,
        minHeight: widget.minHeight,
        minWidth: widget.minWidth,
      ),
      child: SvgPicture.asset(
        path,
        package: "tag_ui",
      ),
    );
  }
}
