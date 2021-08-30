import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    @required this.hour,
    @required this.tacoCode,
    @required this.foodName,
    @required this.turn,
    @required this.studentType,
    @required this.ingredients,
  }) : super(key: key);

  final String hour;
  final String tacoCode;
  final String foodName;
  final String turn;
  final String studentType;
  final String ingredients;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: _Card(
              tacoCode: tacoCode,
              foodName: foodName,
              turn: turn,
              studentType: studentType,
              ingredients: ingredients,
            ),
          ),
        ),
        _HourLabel(hour: hour),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key key,
    @required this.tacoCode,
    @required this.foodName,
    @required this.turn,
    @required this.studentType,
    @required this.ingredients,
  }) : super(key: key);

  final String tacoCode;
  final String foodName;
  final String turn;
  final String studentType;
  final String ingredients;

  @override
  Widget build(BuildContext context) {
    return TagBox(
      minHeight: 100,
      background: TagColors.colorBaseCloudLight,
      padding: const EdgeInsets.only(left: 40, top: 22, bottom: 24),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Text(
                  tacoCode,
                  style: const TextStyle(
                    color: TagColors.colorBaseInkLight,
                  ),
                ),
                Text(" $foodName"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _LabelInfoTurnAndType(text: turn),
                ),
                _LabelInfoTurnAndType(text: studentType)
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                const Text(
                  "Ingredientes ",
                  style: TextStyle(
                    color: TagColors.colorBaseInkLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  ingredients,
                  style: const TextStyle(
                    color: TagColors.colorBaseProductNormal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LabelInfoTurnAndType extends StatelessWidget {
  const _LabelInfoTurnAndType({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TagBox(
      minHeight: 28,
      background: TagColors.colorBaseProductSecondary,
      child: Text(
        text,
        style: const TextStyle(
          color: TagColors.colorBaseProductDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _HourLabel extends StatelessWidget {
  const _HourLabel({
    Key key,
    @required this.hour,
  }) : super(key: key);

  final String hour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: TagBox(
        minHeight: 28,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        background: TagColors.colorBaseProductLightActive,
        child: Text(
          hour,
          style: const TextStyle(fontSize: 14, height: 1.44),
        ),
      ),
    );
  }
}
