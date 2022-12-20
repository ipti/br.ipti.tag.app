import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({
    super.key,
    required this.student,
  });

  final Map<String, dynamic> student;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0, left: 128.0),
      child: Row(
        children: [
          Container(
            height: 256.0,
            width: 256.0,
            decoration: const BoxDecoration(
              color: TagColors.colorBaseCloudDark,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(student['img']),
            ),
          ),
          const SizedBox(
            width: 120.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: TagColors.colorBaseProductNormal,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: const Text(
                  'Nome',
                  style: TextStyle(
                      color: TagColors.colorBaseCloudNormal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
              ),
              Container(
                width: 500.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: TagColors.colorBaseCloudDark,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Text(
                  student['name'],
                  style: const TextStyle(
                      color: TagColors.colorBaseInkLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: TagColors.colorBaseProductNormal,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: const Text(
                  'Turma',
                  style: TextStyle(
                      color: TagColors.colorBaseCloudNormal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
              ),
              Container(
                width: 200.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: TagColors.colorBaseCloudDark,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Text(
                  student['turma'],
                  style: const TextStyle(
                      color: TagColors.colorBaseInkLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
