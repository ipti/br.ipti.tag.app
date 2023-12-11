import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolPanel extends StatelessWidget {
  const SchoolPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      decoration: const BoxDecoration(
        color: TagColors.colorBaseCloudDark,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TagColors.colorBaseWhiteNormal,
                    border: Border.all(color: TagColors.colorBaseProductLogo),
                    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: Icon(
                    Icons.logo_dev,size: size.height * 0.08,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text('Escola', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Inter', color: TagColors.colorBaseProductLogo)),
              ],
            ),
            TagIcon(
              defaultVersionPath: FilePaths.LOGO_PATH_SVG,
              disabledVersionPath: FilePaths.LOGO_PATH_SVG,
              maxHeight: size.height * 0.13,
              maxWidth: size.height * 0.13,
            ),
          ],
        ),
      ),
    );
  }
}
