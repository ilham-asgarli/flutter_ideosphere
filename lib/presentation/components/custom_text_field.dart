import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/extensions/string_extension.dart';
import '../../utils/ui/constants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Color? iconColor, fillColor, hintTextColor, textColor;
  final double? fontSize, radius;
  final String obscuringCharacter;
  final int? maxLength;
  final String? initialValue;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final Function(String)? onChanged;
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
    this.obscuringCharacter = '•',
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
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.maxLength,
    this.initialValue,
    this.counterText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      inputFormatters: inputFormatters,
      onTap: onTap,
      onChanged: onChanged,
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
        fillColor: fillColor ?? AppColors.thirdColor,
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
        counterText: counterText,
      ),
      maxLength: maxLength,
      initialValue: initialValue,
    );
  }
}
