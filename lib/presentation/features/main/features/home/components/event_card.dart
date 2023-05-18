import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.mainColor2,
        ),
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Text(
                "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
              ),
              Text(
                "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
              ),
              Text(
                "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
