import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../components/chats_item.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: context.paddingLow,
              cacheExtent: 1,
              itemCount: context.watch<ChatSocketCubit>().state.chats.length,
              itemBuilder: (context, index) {
                return ChatsItem(
                  index: index,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
            (context.lowValue * 2 + 50).verticalSpace,
          ],
        ),
      ),
    );
  }
}
