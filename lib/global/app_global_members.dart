// is picked image for employee
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/string_extensions_for_forms.dart';

bool imagePicked = false;

// Employee name validator
String? employeeNameFormValidator(String? value) {
  if (value!.isNullOrEmpty()) {
    return 'Required*';
  } else if (!(value.isValidName())) {
    return 'Enter valid name';
  } else {
    return null;
  }
}
