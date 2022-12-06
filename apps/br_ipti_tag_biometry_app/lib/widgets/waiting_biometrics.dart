import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class WaitingBiometrics extends StatelessWidget {
  const WaitingBiometrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0, left: 128.0),
      child: Row(
        children: const [
          Text('Coloque a sua Digital'),
        ],
      ),
    );
  }
}
