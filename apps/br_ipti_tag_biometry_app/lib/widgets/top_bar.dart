import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: TagColors.colorBaseCloudDark,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () =>
                  Modular.to.pushNamed("/biometrics/identification"),
            ),
            const SizedBox(
                width: 256.0,
                child: TagTextField(
                  label: '',
                  hint: "Digite o nome do Aluno",
                )),
            Row(
              children: [
                const Text('Escola',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: TagColors.colorBaseProductLogo)),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: TagColors.colorBaseWhiteNormal,
                    border: Border.all(color: TagColors.colorBaseProductLogo),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: const Icon(
                    Icons.logo_dev,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
