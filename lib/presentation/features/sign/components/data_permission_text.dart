import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/string_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';

class DataPermissionText extends StatelessWidget {
  final String text, regex;
  final Function()? onTap;

  DataPermissionText({
    Key? key,
    required this.text,
    required this.regex,
    this.onTap,
  }) : super(key: key) {
    parts = text.splitToThree(regex);
  }

  late final List<String> parts;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 11,
          color: AppColors.secondColor,
        ),
        text: parts[0],
        children: [
          TextSpan(
            style: const TextStyle(
              color: Colors.blue,
            ),
            text: parts[1],
            recognizer: TapGestureRecognizer()..onTap = onTap,
            children: [
              TextSpan(
                style: TextStyle(
                  color: AppColors.secondColor,
                ),
                text: parts[2],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
