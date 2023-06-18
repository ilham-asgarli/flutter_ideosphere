import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../core/extensions/num_extension.dart';
import '../../../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../components/message_bubble.dart';
import '../state/chat_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          context.read<ChatCubit>().chat.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      body: buildChat(context),
    );
  }

  Widget buildChat(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: LazyLoadScrollView(
            scrollOffset: context.height.toInt(),
            isLoading: context.read<ChatCubit>().state.loadingOldMessages,
            onEndOfPage: () =>
                context.read<ChatCubit>().chatViewModel.loadOldMessages(),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  10.verticalSpace,
                  Visibility(
                    visible: context.read<ChatCubit>().state.loadingOldMessages,
                    child: const CircularProgressIndicator(),
                  ),
                  buildMessages(context),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            const Divider(
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
                      child: buildTextField(context),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildSend(context),
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
  ) {
    return ListView.separated(
      padding: context.paddingNormal,
      physics: const NeverScrollableScrollPhysics(),
      cacheExtent: 1,
      shrinkWrap: true,
      reverse: true,
      itemCount: context
          .watch<ChatSocketCubit>()
          .state
          .chats
          .firstWhere((element) =>
              element.chatModel.id == context.read<ChatCubit>().chat.id)
          .chatMessageModels
          .length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Visibility(
              visible: context.read<ChatCubit>().chatViewModel.isNewDay(index),
              child: Padding(
                padding: context.paddingLow,
                child: Card(
                  color: AppColors.mainColor2,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Text(
                      DateFormat("dd.MM.yyyy").format(
                        DateTime.parse(
                          context
                              .watch<ChatSocketCubit>()
                              .state
                              .chats
                              .firstWhere((element) =>
                                  element.chatModel.id ==
                                  context.read<ChatCubit>().chat.id)
                              .chatMessageModels[index]
                              .createdAt
                              .toString(),
                        ),
                      ),
                      style: const TextStyle(color: AppColors.secondColor),
                    ),
                  ),
                ),
              ),
            ),
            MessageBubble(
              chatMessageModel: context
                  .watch<ChatSocketCubit>()
                  .state
                  .chats
                  .firstWhere((element) =>
                      element.chatModel.id == context.read<ChatCubit>().chat.id)
                  .chatMessageModels[index],
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

  buildTextField(BuildContext context) {
    return TextField(
      cursorColor: AppColors.secondColor,
      style: const TextStyle(
        color: AppColors.secondColor,
      ),
      controller: context.read<ChatCubit>().chatViewModel.textEditingController,
      maxLines: 1,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Mesaj",
      ),
    );
  }

  Widget buildSend(BuildContext context) {
    return IconButton(
      color: AppColors.secondColor,
      icon: const Icon(Icons.send),
      onPressed: () {
        context.read<ChatCubit>().chatViewModel.writeMessage();
        context.read<ChatCubit>().chatViewModel.textEditingController.clear();
      },
    );
  }
}
