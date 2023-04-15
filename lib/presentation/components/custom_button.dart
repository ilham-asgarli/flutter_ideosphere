import 'package:flutter/material.dart';

import '../../utils/ui/constants/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? width, height;
  final double radius;
  final Widget? child;
  final Color? color;
  final Function()? onTap;

  const CustomButton({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.radius = 5,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: width,
          height: height,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: color ?? AppColors.secondColor,
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
