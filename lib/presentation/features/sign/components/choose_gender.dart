import 'package:flutter/material.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';

class ChooseGender extends StatefulWidget {
  final Function(int gender) onChange;

  const ChooseGender({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  int gender = 1;

  @override
  void initState() {
    widget.onChange(gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
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
                  changeGender(1);
                },
              ),
            ),
            const VerticalDivider(
              color: AppColors.mainColor2,
              width: 0,
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
                  changeGender(2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeGender(int gender) {
    widget.onChange(gender);
    setState(() {
      this.gender = gender;
    });
  }
}
