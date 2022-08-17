import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = PatternValidator(
  r'/^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i',
  errorText: 'E-mail inválido',
);
