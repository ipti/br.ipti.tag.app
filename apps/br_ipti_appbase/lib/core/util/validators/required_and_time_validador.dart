import 'package:br_ipti_appbase/core/util/util.dart';

import 'package:form_field_validator/form_field_validator.dart';

FieldValidator get requiredTimeValidator => MultiValidator([
      requiredValidator,
      timeValidator,
    ]);
