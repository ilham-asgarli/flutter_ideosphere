import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/date_time_extension.dart';
import '../../../../../../core/router/core/router_service.dart';
import '../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../../../../../../utils/ui/constants/assets/image_constants.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../widgets/image_placeholder.dart';

class ChatsItem extends StatelessWidget {
  final int index;

  const ChatsItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: AppColors.mainColor2,
      child: ListTile(
        onTap: () {
          RouterService.instance.pushNamed(
            path: RouterConstants.chat,
            data: context.read<ChatSocketCubit>().state.chats[index].chatModel,
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: buildProfilePhoto(),
        title: Text(
          context.watch<ChatSocketCubit>().state.chats[index].chatModel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        subtitle: Text(
          context
                  .watch<ChatSocketCubit>()
                  .state
                  .chats[index]
                  .chatMessageModels
                  .firstOrNull
                  ?.message ??
              "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              (context
                          .watch<ChatSocketCubit>()
                          .state
                          .chats[index]
                          .chatMessageModels
                          .firstOrNull
                          ?.createdAt ??
                      context
                          .read<ChatSocketCubit>()
                          .state
                          .chats[index]
                          .chatModel
                          .createdAt)
                  .formatForToday,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            if (context
                .watch<ChatSocketCubit>()
                .state
                .chats[index]
                .chatMessageModels
                .where((e) => e.opened == false)
                .toList()
                .isNotEmpty)
              CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.thirdColor,
                child: Text(
                  "${context.watch<ChatSocketCubit>().state.chats[index].chatMessageModels.where((e) => e.opened == false).toList().length}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildProfilePhoto({String? url}) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => ImagePlaceholder(
          imageProvider: AssetImage(ImageConstants.instance.icPlayStore),
        ),
        errorWidget: (context, url, error) => ImagePlaceholder(
          imageProvider: AssetImage(ImageConstants.instance.icPlayStore),
        ),
        imageBuilder: (context, image) {
          return ImagePlaceholder(imageProvider: image);
        },
      );
    } else {
      return ImagePlaceholder(
        imageProvider: AssetImage(ImageConstants.instance.icPlayStore),
      );
    }
  }
}
