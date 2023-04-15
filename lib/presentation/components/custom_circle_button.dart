import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomCircleButton extends StatelessWidget {
  final double radius;
  final Widget? child;
  final Color? color;
  final Function()? onTap;

  const CustomCircleButton({
    Key? key,
    this.radius = 25,
    this.child,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: radius * 2,
      height: radius * 2,
      radius: radius,
      onTap: onTap,
      color: color,
      child: child,
    );
  }
}
