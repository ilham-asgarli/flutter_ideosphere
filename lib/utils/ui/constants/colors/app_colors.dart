import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static Color mainColor = HexColor("#151A23");
  static Color mainColor1 = HexColor("#22272F");
  static Color mainColor2 = HexColor("#30353F");

  static Color secondColor = HexColor("#52889F");

  static const Color light = Colors.white;
  static Color dark = Colors.grey[850]!;

  static Color shimmerColor = mainColor;
  static Color shimmerBaseColor = mainColor.withAlpha(100);
  static Color shimmerHighLightColor = mainColor.withAlpha(50);

  static Color defaultShimmerBaseColor = Colors.grey[300]!;
  static Color defaultShimmerHighLightColor = Colors.grey[100]!;
}
