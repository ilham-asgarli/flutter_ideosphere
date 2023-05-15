import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import 'message_bubble.dart';

class BubbleChild extends StatelessWidget {
  final Message? message;

  const BubbleChild({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          Text(
            message?.message ?? "",
            style: TextStyle(
              fontSize: 15,
              color: AppColors.secondColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateFormat("HH:mm").format(
                  DateTime.parse(message?.dateTime ?? ""),
                ),
                style: TextStyle(
                  fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  color: AppColors.secondColor,
                ),
              ),
              Visibility(
                visible: (message?.owner ?? true),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: context.lowValue / 3,
                  ),
                  child: Row(
                    children: [
                      context.dynamicHorizontalSpace(0.01),
                      (message?.NEW ?? true)
                          ? Icon(
                              Icons.done,
                              color: AppColors.secondColor,
                              size: 15,
                            )
                          : const Icon(
                              Icons.done_all,
                              color: Colors.cyanAccent,
                              size: 15,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
