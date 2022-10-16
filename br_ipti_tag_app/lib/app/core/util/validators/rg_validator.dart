import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get rgValidator => PatternValidator(
      r'(^[0-9]{1,2}).?([0-9]{3}).?([0-9]{3})-?([0-9]{1}|X|x$)',
      errorText:
          "O CPF digitado é inválido, verifique número e tente novamente",
    );
