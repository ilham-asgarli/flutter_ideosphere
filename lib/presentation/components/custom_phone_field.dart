import 'package:flutter/material.dart';

import '../../utils/ui/constants/colors/app_colors.dart';
import '../../utils/ui/formatters/international_phone_formatter.dart';
import 'custom_text_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: Colors.white,
      hintText: "Telefon numarası (örn. +90 xxx xx xx)",
      hintTextColor: Colors.grey,
      textColor: AppColors.mainColor,
      keyboardType: TextInputType.phone,
      maxLength: 25,
      inputFormatters: [
        //FilteringTextInputFormatter.digitsOnly,
        InternationalPhoneFormatter(),
      ],
    );
  }
}
