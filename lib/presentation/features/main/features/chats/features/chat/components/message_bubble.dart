import 'package:flutter/material.dart';

import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import 'bubble_background.dart';
import 'bubble_child.dart';

class MessageBubble extends StatelessWidget {
  final Widget? child;
  final Message? message;

  const MessageBubble({
    Key? key,
    this.child,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageAlignment =
        (message?.owner ?? true) ? Alignment.topRight : Alignment.topLeft;

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
              colors: (message?.owner ?? true)
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
                        message: message,
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

class Message {
  final bool? owner;
  final String? message;
  final bool? NEW;
  final String? dateTime;

  Message({
    this.owner,
    this.message,
    this.NEW,
    this.dateTime,
  });
}
