import 'package:email_validator/email_validator.dart';

String? validateEmail(String? value, {String? customErrorMessage}) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  }
  if (!EmailValidator.validate(value)) {
    return 'Please enter a valid email address';
  }
  if (customErrorMessage != null) {
    return customErrorMessage;
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }
  return null;
}

double calculateContainerHeight(int itemCount) {
  const double itemHeight = 50.0; // Assuming each item has a height of 50.0
  const double minHeight = 70.0; // Minimum height when there are no items
  // const double maxHeight = 200.0; // Maximum height when there are many items
  double calculatedHeight = itemCount * itemHeight;
  return calculatedHeight.clamp(minHeight, itemHeight * 3);
}