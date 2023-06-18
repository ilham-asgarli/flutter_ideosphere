import 'package:flutter/material.dart';

import '../../../../../../../../data/models/chat_message.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import 'bubble_background.dart';
import 'bubble_child.dart';

class MessageBubble extends StatelessWidget {
  final Widget? child;
  final ChatMessage chatMessageModel;

  const MessageBubble({
    Key? key,
    this.child,
    required this.chatMessageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageAlignment =
        (chatMessageModel.owner) ? Alignment.topRight : Alignment.topLeft;

    return FractionallySizedBox(
      widthFactor: 1,
      child: FractionallySizedBox(
        alignment: messageAlignment,
        widthFactor: 0.8,
        child: Align(
          alignment: messageAlignment,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: BubbleBackground(
              colors: chatMessageModel.owner
                  ? [
                      Colors.green.shade300,
                      Colors.green,
                    ]
                  : [
                      AppColors.mainColor2,
                      AppColors.mainColor1,
                    ],
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child ??
                      BubbleChild(
                        chatMessageModel: chatMessageModel,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
