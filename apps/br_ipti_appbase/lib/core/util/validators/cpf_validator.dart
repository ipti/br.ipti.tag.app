import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get cpfValidator => PatternValidator(
      r'^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}),)$',
      errorText:
          "O CPF digitado é inválido, verifique número e tente novamente",
    );
