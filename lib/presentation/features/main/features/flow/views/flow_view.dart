import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../../event/components/event_item.dart';

class FlowView extends StatelessWidget {
  const FlowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  context.watch<ChatSocketCubit>().state.closeEvents.length,
              itemBuilder: (context, index) {
                return EventItem(
                  eventModel:
                      context.read<ChatSocketCubit>().state.closeEvents[index],
                );
              },
            ),
          ),
          (context.lowValue * 2 + 50).verticalSpace,
        ],
      ),
    );
  }
}
