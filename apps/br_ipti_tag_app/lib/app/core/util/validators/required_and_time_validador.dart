import 'package:br_ipti_tag_app/app/core/util/validators/required_validator.dart';
import 'package:br_ipti_tag_app/app/core/util/validators/time_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get requiredTimeValidator => MultiValidator([
      requiredValidator,
      timeValidator,
    ]);
