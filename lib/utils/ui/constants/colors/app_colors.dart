import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Color(0xFF151A23);
  static const Color mainColor1 = Color(0xFF22272F);
  static const Color mainColor2 = Color(0xFF30353F);

  static Color secondColor = Colors.white;
  static const Color thirdColor = Color(0xFF52889F);

  static const Color light = Colors.white;
  static Color dark = Colors.grey[850]!;

  static Color shimmerColor = mainColor;
  static Color shimmerBaseColor = mainColor.withAlpha(100);
  static Color shimmerHighLightColor = mainColor.withAlpha(50);

  static Color defaultShimmerBaseColor = Colors.grey[300]!;
  static Color defaultShimmerHighLightColor = Colors.grey[100]!;
}
