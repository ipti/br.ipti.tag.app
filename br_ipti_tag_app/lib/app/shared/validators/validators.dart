import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final requiredValidator = RequiredValidator(
  errorText: 'Esse campo é obrigatório',
);

final timeValidator = TimeValidator(
  errorText: 'Hora inválida',
);

final requiredTimeValidator = MultiValidator([
  requiredValidator,
  timeValidator,
]);

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

final phoneValidator = PatternValidator(
  r'(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})',
  errorText: 'Telefone inválido',
);

final emailValidator = PatternValidator(
  r'/^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i',
  errorText: 'E-mail inválido',
);
