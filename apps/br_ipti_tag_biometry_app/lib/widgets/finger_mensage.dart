import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

class FingerMensage extends StatelessWidget {
  const FingerMensage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32.0),
        SvgPicture.asset('assets/fingerprint.svg'),
        Center(
          heightFactor: 3.0,
          child: Column(
            children: [
              Container(
                height: 40.0,
                width: 256.0,
                decoration: BoxDecoration(
                  color: TagColors.colorBaseCloudDark,
                  border: Border.all(color: TagColors.colorBaseInkLight),
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                ),
                child: Center(child: Text(text)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
