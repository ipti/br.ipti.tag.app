import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TagMasks {
  static final maskDate = new MaskTextInputFormatter(
    mask: '##\/##\/####',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
