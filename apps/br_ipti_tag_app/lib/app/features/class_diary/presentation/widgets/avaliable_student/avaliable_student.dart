// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class AvaliableStudent extends StatefulWidget {
  final String title;
  const AvaliableStudent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AvaliableStudent> createState() => _AvaliableStudentState();
}

class _AvaliableStudentState extends State<AvaliableStudent> {
  late bool check = false;

  @override
  Widget build(BuildContext context) {
    const styleText = TextStyle(
        color: TagColors.colorBaseInkLight,
        fontWeight: FontWeight.w600,
        fontSize: 16);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Checkbox(
            value: check,
            onChanged: (newState) {
              setState(() {
                check = newState!;
              });
            },
          ),
          Text(widget.title, style: styleText,),
        ],
      ),
    );
  }
}
