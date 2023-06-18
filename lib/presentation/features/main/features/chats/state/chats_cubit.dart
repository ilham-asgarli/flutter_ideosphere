import 'package:bloc/bloc.dart';

import '../view-models/chats_view_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(const ChatsState()) {
    chatsViewModel = ChatsViewModel(this);
  }

  late final ChatsViewModel chatsViewModel;
}
