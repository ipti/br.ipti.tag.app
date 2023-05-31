import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class ListStudents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return CardListStudent();
        },
      ),
    );
  }
}

class CardListStudent extends StatefulWidget {
  const CardListStudent({super.key});

  @override
  State<CardListStudent> createState() => _CardListStudentState();
}

class _CardListStudentState extends State<CardListStudent> {
  bool buttonState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Modular.to.pushNamed(
                "detailsstudent",
              ),
              child: const Text("ACACIA COSTA DOS SANTOS ARAUJO"),
            ),
            Checkbox(
              value: buttonState,
              onChanged: (newState) {
                setState(() {
                  buttonState = newState!;
                });
              },
            ),
          ],
        ),
        Container(
          height: 1,
          color: TagColors.colorBaseCloudLight,
        ),
      ],
    );
  }
}
