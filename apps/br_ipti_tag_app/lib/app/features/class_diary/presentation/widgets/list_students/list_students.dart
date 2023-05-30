import 'package:flutter/cupertino.dart';
import 'package:tag_ui/tag_ui.dart';

class ListStudents extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
    child: Column(children: [
      Row(children: [
        const Text("ACACIA COSTA DOS SANTOS ARAUJO"),
        TagCheckbox(onChanged: (e) => {}, label: ""),
      ],),
    ]),
    );
  }
}
