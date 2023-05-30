import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class CardClassDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const styleResult = TextStyle(
        color: TagColors.colorBaseProductDark,
        fontWeight: FontWeight.w500,
        fontSize: 16);

    const styleTextDark = TextStyle(
        color: TagColors.colorBaseInkNormal,
        fontWeight: FontWeight.w400,
        fontSize: 16);

    const styleText = TextStyle(
        color: TagColors.colorBaseInkLight,
        fontWeight: FontWeight.w400,
        fontSize: 16);

    return InkWell(
      onTap: () => Modular.to.pushNamed(
        "details",
      ),
      child: TagBox(
        minHeight: 48,
        minWidth: MediaQuery.of(context).size.width * 1,
        background: TagColors.colorBaseCloudLight,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //  color: TagColors.colorBaseProductLightActive,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: TagColors.colorBaseProductLightActive,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "LÍNGUA / LITERATURA",
                  style: styleResult,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "3º ANO INTEGRAL",
                style: styleTextDark,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text("Ensino Fundamental de 9 anos - 9º Ano",
                  style: styleText),
            ),
          ],
        ),
      ),
    );
  }
}
