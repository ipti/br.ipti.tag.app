import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get emailValidator {
  return EmailValidator(
    errorText: 'o email precisa seguir o formato exemplo@email.com',
  );
}
