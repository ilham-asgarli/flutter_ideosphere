import 'package:flutter/material.dart';

import '../../../../core/extensions/date_time_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../data/models/event.dart';

class EventTimes extends StatelessWidget {
  final Event eventModel;

  const EventTimes({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (eventModel.startTime != null)
          Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Colors.green,
                size: 15,
              ),
              5.horizontalSpace,
              Text(eventModel.startTime!.ddMMyyyy),
            ],
          ),
        if (eventModel.endTime != null)
          Row(
            children: [
              const Icon(
                Icons.timer,
                color: Colors.red,
                size: 15,
              ),
              5.horizontalSpace,
              Text(eventModel.endTime!.ddMMyyyy),
            ],
          ),
      ],
    );
  }
}
