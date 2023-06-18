import 'package:flutter/material.dart';

import '../../utils/ui/constants/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? width, height;
  final double radius;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Color? color, textColor;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  const CustomButton({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.radius = 12,
    this.onTap,
    this.color,
    this.textColor,
    this.text,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            color: color ?? AppColors.thirdColor,
          ),
          padding: padding,
          child: Center(
            child: child ??
                Text(
                  text ?? "",
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
