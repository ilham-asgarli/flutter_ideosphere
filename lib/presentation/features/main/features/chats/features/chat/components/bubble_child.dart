import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../data/models/chat_message.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';

class BubbleChild extends StatelessWidget {
  final ChatMessage chatMessageModel;

  const BubbleChild({
    Key? key,
    required this.chatMessageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          Text(
            chatMessageModel.message,
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
                  chatMessageModel.createdAt,
                ),
                style: TextStyle(
                  fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  color: AppColors.secondColor,
                ),
              ),
              Visibility(
                visible: chatMessageModel.owner,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: context.lowValue / 3,
                  ),
                  child: Row(
                    children: [
                      context.dynamicHorizontalSpace(0.01),
                      chatMessageModel.readAll
                          ? const Icon(
                              Icons.done_all,
                              color: Colors.cyanAccent,
                              size: 15,
                            )
                          : Icon(
                              Icons.done,
                              color: AppColors.secondColor,
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
