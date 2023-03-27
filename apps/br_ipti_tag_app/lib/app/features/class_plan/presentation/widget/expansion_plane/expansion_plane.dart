// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/create_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  
  final List<Classes> classes;
  
  const Steps({
    super.key,
    required this.classes,
  });
  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  late List<Classes> _steps;

  @override
  void initState() {
    _steps = widget.classes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _renderSteps(),
      ),
    );
  }
  Widget _renderSteps() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Classes step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text("Aula" + context.hashCode.toString()),
            );
          },
          body: NewClassForm(),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}