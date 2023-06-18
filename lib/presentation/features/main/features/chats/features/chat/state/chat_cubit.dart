import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../data/models/chat.dart';
import '../../../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../view-models/chat_view_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final BuildContext context;
  late final ChatViewModel chatViewModel;
  final Chat chat;

  ChatCubit(this.context, this.chat) : super(const ChatState()) {
    chatViewModel = ChatViewModel(this, context);
    chatViewModel.startChat();
    context.read<ChatSocketCubit>().openChatId = chat.id;
  }

  changeLoadingOldMessages(bool loadingOldMessages) {
    emit(state.copyWith(loadingOldMessages: loadingOldMessages));
  }

  @override
  Future<void> close() {
    context.read<ChatSocketCubit>().openChatId = "";
    return super.close();
  }
}
