part of 'chat_cubit.dart';

class ChatState {
  final bool loadingOldMessages;

  const ChatState({this.loadingOldMessages = false});

  ChatState copyWith({bool? loadingOldMessages}) {
    return ChatState(
      loadingOldMessages: loadingOldMessages ?? this.loadingOldMessages,
    );
  }
}
