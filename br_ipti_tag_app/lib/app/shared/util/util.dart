import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay(String value) {
  final hour = int.parse(value.split(":")[0]);
  final minute = int.parse(value.split(":")[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
