part of 'chat_socket_cubit.dart';

@immutable
class ChatSocketState {
  final List<ChatWithMessagesModel> chats;
  final List<Event> closeEvents;

  const ChatSocketState({
    this.chats = const [],
    this.closeEvents = const [],
  });

  ChatSocketState copyWith({
    List<ChatWithMessagesModel>? chats,
    List<Event>? closeEvents,
  }) {
    return ChatSocketState(
      chats: chats ?? this.chats,
      closeEvents: closeEvents ?? this.closeEvents,
    );
  }
}

class ChatWithMessagesModel {
  final Chat chatModel;
  final List<ChatMessage> chatMessageModels;

  const ChatWithMessagesModel({
    required this.chatModel,
    this.chatMessageModels = const [],
  });

  factory ChatWithMessagesModel.fromJson(Map<String, dynamic> json) =>
      ChatWithMessagesModel(
          chatModel: Chat.fromJson(json["chat"]),
          chatMessageModels: (json["messages"] as List)
              .map((e) => ChatMessage.fromJson(e))
              .toList());

  Map<String, dynamic> toJson() {
    return {
      "chat": chatModel.toJson(),
      "messages": chatMessageModels.map((e) => e.toJson()).toList(),
    };
  }
}
