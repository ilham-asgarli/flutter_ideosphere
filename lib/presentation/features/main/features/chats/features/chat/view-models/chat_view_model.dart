import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../state/chat_cubit.dart';

class ChatViewModel {
  final ChatCubit chatCubit;
  final BuildContext context;

  ChatViewModel(this.chatCubit, this.context);

  TextEditingController textEditingController = TextEditingController();

  void startChat() {
    var unreadMessages = context
        .read<ChatSocketCubit>()
        .state
        .chats
        .firstWhere((element) => element.chatModel.id == chatCubit.chat.id)
        .chatMessageModels
        .where((element) => element.readAll == false)
        .map((e) => e.id)
        .toList();

    context.read<ChatSocketCubit>().openMessages(chatCubit.chat.id);

    context.read<ChatSocketCubit>().channel.sink.add(
          jsonEncode({
            'name': 'open-messages',
            'body': {
              "messages": unreadMessages,
              "chat_id": chatCubit.chat,
            },
          }),
        );
  }

  void writeMessage() {
    context.read<ChatSocketCubit>().channel.sink.add(
          jsonEncode({
            'name': 'new-message',
            'body': {
              "message": textEditingController.text,
              "chat_id": chatCubit.chat,
            },
          }),
        );
  }

  void loadOldMessages() async {
    chatCubit.changeLoadingOldMessages(true);
    //TODO load old chat
    Future.delayed(const Duration(seconds: 3));
    chatCubit.changeLoadingOldMessages(false);
  }

  bool isNewDay(int index) {
    final messages = context
        .read<ChatSocketCubit>()
        .state
        .chats
        .firstWhere((element) => element.chatModel.id == chatCubit.chat.id)
        .chatMessageModels;

    if (index == messages.length - 1) {
      return true;
    }

    return DateTime.parse(messages[index].createdAt.toString()).day !=
        DateTime.parse(messages[index + 1].createdAt.toString()).day;
  }
}
