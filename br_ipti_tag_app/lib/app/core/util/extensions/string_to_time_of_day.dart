import 'package:flutter/material.dart';

extension StringToTimeExtension on String {
  TimeOfDay get parseTimeOfDay {
    final hour = int.parse(split(":")[0]);
    final minute = int.parse(split(":")[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}
