import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

class TagButtonIcon extends StatelessWidget {
  const TagButtonIcon({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.buttonStyle,
    this.textStyle,
  }) : super(key: key);
  final Function() onPressed;
  final String label;
  final String icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton.icon(
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: TagColors.colorBaseCloudNormal,
              padding: TagSpancing.paddingButtonNormal,
              minimumSize: const Size(40, TagSizes.heightButtonNormal),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    TagBorderRadiusValues.borderRadiusNormal,
                  ),
                ),
              ),
            ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
        ),
        label: Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: TagColors.colorBaseInkNormal,
              ),
        ),
      ),
    );
  }
}
