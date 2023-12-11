import 'package:flutter/material.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({
    super.key,
    required this.student,
  });

  final StudentIdentification? student;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> itens = [
      Container(
        width: size.width < size.height ? size.width*0.8 : size.height*0.55,
        height: size.width < size.height ? size.width*0.8 : size.height*0.55,
        decoration: const BoxDecoration(
          color: TagColors.colorBaseCloudDark,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: const FittedBox(
          fit: BoxFit.fill,
          child: Icon(Icons.person),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                width: 500.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: TagColors.colorBaseProductNormal, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Text('Nome', style: TextStyle(color: TagColors.colorBaseCloudNormal, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
              ),
              Container(
                width: 500.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: TagColors.colorBaseCloudDark, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child:
                    Text(student!.name ?? "Não definido", style: const TextStyle(color: TagColors.colorBaseInkLight, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 200.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: TagColors.colorBaseProductNormal, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Text('Turma', style: TextStyle(color: TagColors.colorBaseCloudNormal, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
              ),
              Container(
                width: 200.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: TagColors.colorBaseCloudDark, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Text(student!.registerType ?? "Não definido",
                    style: const TextStyle(color: TagColors.colorBaseInkLight, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
              ),
            ],
          )
        ],
      ),
    ];
    return Expanded(
      child : size.width > size.height ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center, children: itens) : Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: itens),
    );
  }
}
