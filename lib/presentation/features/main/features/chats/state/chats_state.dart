part of 'chats_cubit.dart';

class ChatsState {
  final List chatMessageModels;

  const ChatsState({
    this.chatMessageModels = const [],
  });

  ChatsState copyWith({
    List? chatMessageModels,
  }) {
    return ChatsState(
      chatMessageModels: chatMessageModels ?? this.chatMessageModels,
    );
  }
}
