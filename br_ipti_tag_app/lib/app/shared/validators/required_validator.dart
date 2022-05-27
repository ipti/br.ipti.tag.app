import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get requiredValidator => RequiredValidator(
      errorText: 'Esse campo é obrigatório',
    );
