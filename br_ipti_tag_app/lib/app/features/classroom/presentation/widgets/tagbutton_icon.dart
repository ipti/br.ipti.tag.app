import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/components/components.dart';

class TagButtonIcon extends StatelessWidget {
  const TagButtonIcon({Key? key, required this.icon, required this.label})
      : super(key: key);
  final String icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton.icon(
        onPressed: () {
          debugPrint('null');
        },
        icon: SvgPicture.asset(
          icon,
        ),
        label: Text(label),
      ),
    );
  }
}
