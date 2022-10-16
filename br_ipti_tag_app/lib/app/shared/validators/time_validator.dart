import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get timeValidator => TimeValidator(
      errorText: 'Hora inválida',
    );

class TimeValidator extends TextFieldValidator {
  TimeValidator({required String errorText}) : super(errorText);
  @override
  bool isValid(String? value) {
    try {
      final int hour = int.parse(value!.split(":")[0]);
      final int minute = int.parse(value.split(":")[1]);
      TimeOfDay(hour: hour, minute: minute);

      return hour < 24 && minute < 60 && hour >= 0 && minute >= 0;
    } catch (e) {
      return false;
    }
  }
}
