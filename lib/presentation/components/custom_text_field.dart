import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/extensions/string_extension.dart';
import '../../utils/ui/constants/colors/app_colors.dart';
import '../../utils/ui/formatters/international_phone_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Color? iconColor, fillColor, hintTextColor, textColor;
  final double? fontSize, radius;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  const CustomTextField({
    Key? key,
    this.hintText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.iconColor,
    this.fillColor,
    this.fontSize,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.hintTextColor,
    this.contentPadding,
    this.radius,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: keyboardType == TextInputType.phone
          ? [
              FilteringTextInputFormatter.digitsOnly,
              InternationalPhoneFormatter(),
            ]
          : null,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: fillColor ?? AppColors.secondColor,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ImageIcon(
                  AssetImage(prefixIcon!.toPNG),
                  size: 25,
                  color: iconColor,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ImageIcon(
                  AssetImage(suffixIcon!.toPNG),
                  size: 25,
                  color: iconColor,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(),
        suffixIconConstraints: const BoxConstraints(),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
