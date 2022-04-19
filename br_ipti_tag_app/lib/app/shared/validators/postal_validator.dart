import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get postalValidator => PatternValidator(
      r'(^[0-9]{5})-?([0-9]{3}$)',
      errorText: "O CEP digitado é inválido",
    );
