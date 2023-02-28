import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolPanel extends StatelessWidget {
  const SchoolPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: TagColors.colorBaseCloudDark,
      ),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    color: TagColors.colorBaseWhiteNormal,
                    border: Border.all(color: TagColors.colorBaseProductLogo),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: const Icon(
                    Icons.logo_dev,
                    size: 64,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text('Escola',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: TagColors.colorBaseProductLogo)),
              ],
            ),
            TagIcon(
              defaultVersionPath: FilePaths.LOGO_PATH_SVG,
              disabledVersionPath: FilePaths.LOGO_PATH_SVG,
              maxHeight: 100.0,
              maxWidth: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
