import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay(String value) {
  var hour = num.parse(value.split(":")[0]);
  var minute = num.parse(value.split(":")[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
