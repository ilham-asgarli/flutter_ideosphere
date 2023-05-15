import 'package:flutter/services.dart';

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(value) {
    String nums = value.replaceAll(RegExp(r'\D'), '');
    String internationalPhoneFormatted = nums.isNotEmpty ? '+$nums' : '+$nums';
    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    /*if (newValue.selection.baseOffset == 0) {
      return newValue;
    }*/

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: TextSelection.collapsed(
            offset: internationalPhoneFormat(text).length));
  }
}
