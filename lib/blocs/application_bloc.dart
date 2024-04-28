import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/phone_number.dart';

class ApplicationBloc extends ChangeNotifier {
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  late bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  String? validatePhoneNumber(PhoneNumber? number) {
    if (number!.number.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!number.isValidNumber()) {
      return 'Please enter a valid phone number';
    }
    _phoneNumber = number.completeNumber;
    notifyListeners();
    return null;
  }
}