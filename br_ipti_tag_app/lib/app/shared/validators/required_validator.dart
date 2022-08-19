import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get requiredValidator => RequiredValidator(
      errorText: 'Esse campo é obrigatório',
    );

FieldValidator requiredDropdownValidator<T>() =>
    DropdownRequiredValidator<T>(errorText: 'Esse campo é obrigatório');

class DropdownRequiredValidator<T> extends FieldValidator<T> {
  DropdownRequiredValidator({
    required String errorText,
  }) : super(errorText);
  @override
  bool isValid(T? value) {
    final isNull = value == null;
    if (isNull) {
      return false;
    }
    return true;
  }
}
