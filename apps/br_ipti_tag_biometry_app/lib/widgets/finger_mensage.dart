import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FingerMensage extends StatelessWidget {
  const FingerMensage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0, left: 128.0),
      child: Row(
        children: [
          Text(text),
        ],
      ),
    );
  }
}
