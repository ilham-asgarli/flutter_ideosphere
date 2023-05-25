import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../core/extensions/num_extension.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../components/message_bubble.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          /*_chatViewModel.chatContactController?.fullName ??*/ "Etkinlik ismi",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      body: buildChat(context, [
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: false,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: false,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: false,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: false,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
        Message(
          owner: true,
          NEW: true,
          dateTime: "2012-02-27 13:27:00",
          message: "Lorem Ipsum",
        ),
      ]),
    );
  }

  Widget buildChat(
    BuildContext context,
    List<Message>? contents,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: LazyLoadScrollView(
            scrollOffset: context.height.toInt(),
            //isLoading: _chatViewModel.chatNotifier.isLoadingOldMessages,
            onEndOfPage: () {}, // => _chatViewModel.loadOldMessages(),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  10.verticalSpace,
                  Visibility(
                    visible:
                        false, //_chatViewModel.chatNotifier.isLoadingOldMessages,
                    child: const CircularProgressIndicator(),
                  ),
                  buildMessages(context, contents),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Divider(
              height: 0,
              color: AppColors.mainColor2,
            ),
            Ink(
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.normalValue,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildSend(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMessages(
    BuildContext context,
    List<Message>? contents,
  ) {
    return ListView.separated(
      padding: context.paddingNormal,
      physics: const NeverScrollableScrollPhysics(),
      cacheExtent: 1,
      reverse: true,
      shrinkWrap: true,
      itemCount: contents?.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Visibility(
              //visible: _chatViewModel.isNewDay(contents, index),
              child: Padding(
                padding: context.paddingLow,
                child: Card(
                  color: AppColors.mainColor2,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Text(
                      DateFormat("dd.MM.yyyy").format(
                        DateTime.parse(contents?[index].dateTime ?? ""),
                      ),
                      style: TextStyle(color: AppColors.secondColor),
                    ),
                  ),
                ),
              ),
            ),
            MessageBubble(
              message: contents?[index],
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }

  buildTextField() {
    return TextField(
      //focusNode: focusNode,
      cursorColor: AppColors.secondColor,
      style: TextStyle(
        color: AppColors.secondColor,
      ),
      //controller: textEditingController,
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none, //OutlineInputBorder(),
        hintText: "Mesaj",
      ),
    );
  }

  Widget buildSend() {
    return false //_chatViewModel.chatNotifier.isSendingMessage
        ? Container(
            margin: const EdgeInsets.only(right: 15),
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: AppColors.secondColor,
            ),
          )
        : IconButton(
            color: AppColors.secondColor,
            icon: const Icon(Icons.send),
            onPressed: () {
              /*_chatViewModel.sendMessage(
                _chatViewModel.chatContactController?.username,
                textEditingController.text,
              );

              textEditingController.clear();*/
            },
          );
  }
}
