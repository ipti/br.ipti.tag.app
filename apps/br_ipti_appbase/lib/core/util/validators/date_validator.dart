import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get dateValidator => DateValidator(
      'dd/MM/yyyy',
      errorText: "O campo deve possuir uma data válida no formato dd/mm/aaaa",
    );
