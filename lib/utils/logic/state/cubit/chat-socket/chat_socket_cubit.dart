import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../core/cache/shared_preferences_manager.dart';
import '../../../../../data/models/chat.dart';
import '../../../../../data/models/chat_message.dart';
import '../../../../../data/models/event.dart';
import '../../../constants/api/api_url_constants.dart';
import '../../../constants/cache/shared_preferences_constants.dart';

part 'chat_socket_state.dart';

class ChatSocketCubit extends HydratedCubit<ChatSocketState> {
  late WebSocketChannel channel;

  String openChatId = "";
  int connectionAttempt = 0;

  final retryDelay = const Duration(seconds: 5);
  final maxRetries = 5;

  ChatSocketCubit() : super(const ChatSocketState());

  void connect() {
    final url = Uri.parse(ApiUrlConstants.socket);

    channel = IOWebSocketChannel.connect(
      url,
      headers: {
        'Authorization': SharedPreferencesManager.instance.preferences
            ?.getString(SharedPreferencesConstants.accessToken),
      },
    );

    listen();
  }

  void listen() {
    channel.stream.listen(
      (event) {
        final json = jsonDecode(event.toString());
        String name = json["name"];
        dynamic data = json["data"];

        switch (name) {
          case "start":
            List contacts = data["chats"];

            setChatModels(contacts.map((e) => Chat.fromJson(e)).toList());

            for (var element in contacts) {
              setChatMessageModels(
                  element["id"],
                  (element["messages"] as List)
                      .map((e) => ChatMessage.fromJson(e))
                      .toList());
            }
            break;
          case "close-events":
            List events = data;

            setEvents(events.map((e) => Event.fromJson(e["event"])).toList());
            break;
          case "add-contact":
            addChatModel(Chat.fromJson(data));
            break;
          case "messages":
            List messages = data["messages"];

            setChatMessageModels(
              data["chat_id"],
              messages.map((e) {
                return ChatMessage.fromJson(e);
              }).toList(),
            );
            break;
          case "new-message":
            var message = ChatMessage.fromJson(data["message"]);

            addChatMessageModel(
              data["chat_id"],
              message,
            );

            if (openChatId.isNotEmpty && openChatId == data["chat_id"]) {
              channel.sink.add(
                jsonEncode({
                  'name': 'open-messages',
                  'body': {
                    "messages": [message.id],
                    "chat_id": data["chat_id"],
                  },
                }),
              );

              openMessages(data["chat_id"]);
            }
            break;
          case "opened-messages":
            readMessages(data["chat_id"], data["messages"]);
            break;
        }
      },
      onError: (e) {
        retryConnection();
      },
      onDone: () {
        print("done");
      },
    );
  }

  void retryConnection() {
    if (connectionAttempt < maxRetries) {
      Timer(retryDelay, () {
        connectionAttempt++;
        connect(); // Retry connection
      });
    }
  }

  void setEvents(List<Event> eventModels) {
    emit(state.copyWith(
      closeEvents: eventModels,
    ));
  }

  void setChatModels(List<Chat> chatModels) {
    var chats = chatModels.map((e) {
      return state.chats.firstWhere(
        (element) {
          return element.chatModel.id == e.id;
        },
        orElse: () {
          return ChatWithMessagesModel(chatModel: e);
        },
      );
    }).toList();

    emit(state.copyWith(chats: chats));
  }

  void addChatModel(Chat chatModel) {
    emit(state.copyWith(
      chats: state.chats.toList()
        ..insert(0, ChatWithMessagesModel(chatModel: chatModel)),
    ));
  }

  void setChatMessageModels(
      String chatId, List<ChatMessage> chatMessageModels) {
    var chats = state.chats.map((e) {
      if (e.chatModel.id == chatId) {
        return ChatWithMessagesModel(
            chatModel: e.chatModel, chatMessageModels: chatMessageModels);
      }
      return e;
    }).toList();

    emit(state.copyWith(chats: chats));
  }

  void addChatMessageModel(String chatId, ChatMessage chatMessageModel) {
    var chats = state.chats.map((e) {
      if (e.chatModel.id == chatId) {
        return ChatWithMessagesModel(
          chatModel: e.chatModel,
          chatMessageModels: e.chatMessageModels.toList()
            ..insert(0, chatMessageModel),
        );
      }
      return e;
    }).toList();

    emit(state.copyWith(
      chats: chats,
    ));
  }

  void openMessages(String chatId) {
    state.chats
        .firstWhere((element) => element.chatModel.id == chatId)
        .chatMessageModels
        .forEach((element) {
      element.opened = true;
    });

    emit(state);
  }

  void readMessages(String chatId, List<dynamic> messages) {
    messages.map((e) {
      state.chats
          .firstWhere((element) => element.chatModel.id == chatId)
          .chatMessageModels
          .firstWhere((element) => element.id == e["id"])
          .readAll = e["read_all"];
      return;
    }).toList();

    emit(state);
  }

  @override
  ChatSocketState? fromJson(Map<String, dynamic> json) {
    List chats = json["chats"];

    return ChatSocketState(
      chats: chats.map((e) => ChatWithMessagesModel.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(ChatSocketState state) {
    return {
      "chats": state.chats.map((e) => e.toJson()).toList(),
    };
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }
}
