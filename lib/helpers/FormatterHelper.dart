import 'package:flutter/services.dart';

class FormatterHelper {
  static TextInputFormatter decimalFilter() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  static TextInputFormatter ipAddressFilter() {
    return FilteringTextInputFormatter.allow(RegExp("[0-9.]"));
  }
}
