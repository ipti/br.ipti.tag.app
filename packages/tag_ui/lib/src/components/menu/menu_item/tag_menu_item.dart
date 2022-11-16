import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

enum MenuItemState { Normal, Hover, Click, Disabled }

class TagMenuItem extends StatelessWidget {
  const TagMenuItem({required this.props, required this.onTap});
  final TagMenuItemProps props;
  final void Function(String route) onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = props.isActive
        ? TagColors.colorBaseProductDark
        : TagColors.colorBaseInkLight;

    final textStyle = TextStyle(
      color: textColor,
      fontWeight: TagFontWeight.fontWeightLinks,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
    );
    final indicatorColor =
        props.isActive ? TagColors.colorBaseProductDark : Colors.transparent;

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 24,
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                  color: indicatorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                TagBorderRadiusValues.borderRadiusLarge,
              ),
              onTap: () {
                onTap(props.path.path);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    TagBorderRadiusValues.borderRadiusLarge,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: ConstrainedBox(
                  constraints: constraints,
                  child: Row(
                    children: [
                      if (props.icon != null)
                        props.icon!..disabled = !props.isActive,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            props.path.label,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
