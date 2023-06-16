import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class CardPlanClass extends StatelessWidget {
  const CardPlanClass({super.key, required this.listPlanclasses});
  final PlanClass listPlanclasses;

  @override
  Widget build(BuildContext context) {
    const styleText = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

    return InkWell(
      onTap: () => {},
      child: TagBox(
        minHeight: 48,
        background: TagColors.colorBaseProductLighter,
        padding: EdgeInsets.zero,
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          dense: true,
          horizontalTitleGap: 8,
          title: Row(
            children: [
              Icon(Icons.delete),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listPlanclasses.name, style: styleText,),
                    Text(listPlanclasses.etapas.name, style: styleText,),
                  ],
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: TagColors.colorBaseInkNormal,
          ),
        ),
      ),
    );
  }
}
