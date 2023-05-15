import 'package:flutter/material.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  int gender = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              height: 50,
              color: gender == 1 ? Colors.blue : AppColors.secondColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: ImageIcon(
                AssetImage("ic_male".toPNG),
                color: gender == 1 ? AppColors.secondColor : Colors.blue,
              ),
              onTap: () {
                setState(() {
                  gender = 1;
                });
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              height: 50,
              color: gender == 2 ? Colors.pink : AppColors.secondColor,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(12),
              ),
              child: ImageIcon(
                AssetImage("ic_female".toPNG),
                color: gender == 2 ? AppColors.secondColor : Colors.pink,
              ),
              onTap: () {
                setState(() {
                  gender = 2;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
