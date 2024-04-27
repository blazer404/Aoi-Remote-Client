import 'package:flutter/services.dart';

class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var stringBuffer = StringBuffer();
    int dotCount = 0;
    String textField = '';
    for (int i = 0; i < text.length; i++) {
      if (dotCount > 3) {
        continue;
      }
      if (text[i] == '.' && dotCount < 3) {
        stringBuffer.write('.');
        dotCount++;
        textField = '';
        continue;
      }
      textField += text[i];
      switch (textField.length) {
        case 1:
        case 2:
          stringBuffer.write(text[i]);
          break;
        case 3:
          if (int.parse(textField) <= 255) {
            stringBuffer.write(text[i]);
          } else if (dotCount < 3) {
            stringBuffer.write('.');
            stringBuffer.write(text[i]);
            textField = text[i];
            dotCount++;
          }
          break;
        case 4:
          if (dotCount < 3) {
            stringBuffer.write('.');
            stringBuffer.write(text[i]);
            textField = text[i];
            dotCount++;
          }
          break;
        default:
          break;
      }
    }
    var string = stringBuffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
