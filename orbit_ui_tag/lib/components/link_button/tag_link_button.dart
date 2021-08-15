import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

class TagLinkButton extends StatelessWidget {
  const TagLinkButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: TagColors.colorTextButtonLinkPrimary,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
    );

    final elevatedButtonTheme = TextButton.styleFrom(
      elevation: 0,
      textStyle: textStyle,
      padding: TagSpancing.paddingButtonNormal,
      minimumSize: Size(double.infinity, TagSizes.heightButtonNormal),
      primary: TagBackgroundColors.backgroundButtonPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            TagBorderRadiusValues.borderRadiusLarge,
          ),
        ),
      ),
    );

    return Container(
      child: TextButton(
        child: Text(text),
        onPressed: onPressed,
        style: elevatedButtonTheme,
      ),
    );
  }
}
