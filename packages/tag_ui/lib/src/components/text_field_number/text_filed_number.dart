import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../tag_ui.dart';
import '../shared/tag_input_decoration.dart';

class TagTextFieldNumber extends StatefulWidget {
  const TagTextFieldNumber({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText,
    this.maxLength,
    this.formatters,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.value,
    this.minHeight = TagSizes.heightInputNormal,
    this.maxHeight = TagSizes.heightInputNormal + TagSizes.heightInputSmall,
    this.minWidth = TagSizes.widthStopoverArrow,
    this.maxWidth = TagSizes.widthStopoverArrow + TagSizes.widthIconSmall,
    this.maxLines = 1,
    this.minLines = 1,
    this.padding = TagSpancing.paddingTextField,
  });

  final String? hint;
  final String label;
  final String? value;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final double minHeight;
  final double minWidth;
  final double maxHeight;
  final double maxWidth;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final EdgeInsets padding;
  @override
  State<TagTextFieldNumber> createState() => _TagTextFieldNumberState();
}

class _TagTextFieldNumberState extends State<TagTextFieldNumber> {
  final _debouncer = Debouncer(
    delay: Duration(milliseconds: 250),
  );
  void _onValueChanged(String value) {
    if (widget.onChanged != null) {
      _debouncer.call(
        () => widget.onChanged!(value),
      );
    } else if (widget.onEditingComplete != null) {
      _debouncer.call(
        () => widget.onEditingComplete!(),
      );
    }
  }

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.value ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: TagFontSize.fontSizeInputNormal,
    );

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TagLabel(widget.label),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: widget.minHeight,
                minWidth: widget.minWidth,
                maxHeight: widget.maxHeight,
                maxWidth: widget.maxWidth),
            child: TextFormField(
             
                key: widget.key ?? Key(widget.label),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                controller: _controller,
                obscureText: widget.obscureText ?? false,
                inputFormatters: widget.formatters,
                maxLength: widget.maxLength,
                keyboardType: TextInputType.number,
                style: textStyle,
                validator: widget.validator,
                decoration: buildInputDecoration(widget.hint),
                onChanged: _onValueChanged,
                onEditingComplete: () {
                  _onValueChanged(_controller.text);
                  if (widget.onEditingComplete != null)
                    widget.onEditingComplete!();
                }),
          ),
        ],
      ),
    );
  }
}
