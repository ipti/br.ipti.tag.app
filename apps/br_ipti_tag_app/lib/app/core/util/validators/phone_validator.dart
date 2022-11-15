import 'package:form_field_validator/form_field_validator.dart';

final phoneValidator = PatternValidator(
  r'(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})',
  errorText: 'O Telefone digitado é inválido, verifique e tente novamente',
);
