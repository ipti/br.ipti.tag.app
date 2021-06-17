import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/font_size.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

enum HeadingType {
  DisplayTitle,
  DisplaySubtitle,
  Title1,
  Title2,
  Title3,
  Title4,
  Title5
}

class Heading extends StatelessWidget {
  const Heading({
    Key key,
    @required this.text,
    @required this.type,
  }) : super(key: key);

  final String text;
  final HeadingType type;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyleDefault = TextStyle(
      color: TagColors.colorHeading,
    );

    final TextStyle textStyleDisplayTitle = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingDisplay,
      fontWeight: TagFontWeight.fontWeightHeadingDisplay,
    );

    final TextStyle textStyleDisplaySubtitle = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingDisplaySubtitle,
      fontWeight: TagFontWeight.fontWeightHeadingDisplaySubtitle,
    );

    final TextStyle textStyleTitle1 = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingTitle1,
      fontWeight: TagFontWeight.fontWeightHeadingTitle1,
    );

    final TextStyle textStyleTitle2 = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingTitle2,
      fontWeight: TagFontWeight.fontWeightHeadingTitle2,
    );
    final TextStyle textStyleTitle3 = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingTitle3,
      fontWeight: TagFontWeight.fontWeightHeadingTitle3,
    );
    final TextStyle textStyleTitle4 = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingTitle4,
      fontWeight: TagFontWeight.fontWeightHeadingTitle4,
    );
    final TextStyle textStyleTitle5 = textStyleDefault.copyWith(
      fontSize: TagFontSize.fontSizeHeadingTitle5,
      fontWeight: TagFontWeight.fontWeightHeadingTitle5,
    );

    TextStyle style;

    switch (type) {
      case HeadingType.DisplayTitle:
        style = textStyleDisplayTitle;
        break;
      case HeadingType.DisplaySubtitle:
        style = textStyleDisplaySubtitle;
        break;
      case HeadingType.Title1:
        style = textStyleTitle1;
        break;
      case HeadingType.Title2:
        style = textStyleTitle2;
        break;
      case HeadingType.Title3:
        style = textStyleTitle3;
        break;
      case HeadingType.Title4:
        style = textStyleTitle4;
        break;
      case HeadingType.Title5:
        style = textStyleTitle5;
        break;
      default:
        style = textStyleDefault;
    }

    return Container(
      child: AutoSizeText(
        text,
        style: style,
      ),
    );
  }
}
