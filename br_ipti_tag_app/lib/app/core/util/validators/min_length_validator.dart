import 'package:form_field_validator/form_field_validator.dart';

FieldValidator minLengthValidator(int min) => MinLengthValidator(
      min,
      errorText: 'O campo deve ter no mínimo $min caracteres',
    );
