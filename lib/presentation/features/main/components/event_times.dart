import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extension.dart';

class EventTimes extends StatelessWidget {
  const EventTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.timer_outlined,
              color: Colors.green,
              size: 15,
            ),
            5.horizontalSpace,
            Text("28.04.2023"),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.timer,
              color: Colors.red,
              size: 15,
            ),
            5.horizontalSpace,
            Text("28.05.2023"),
          ],
        ),
      ],
    );
  }
}
