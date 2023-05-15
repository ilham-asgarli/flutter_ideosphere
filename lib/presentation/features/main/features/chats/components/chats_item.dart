import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/router/core/router_service.dart';
import '../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../utils/ui/constants/assets/image_constants.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../widgets/image_placeholder.dart';

class ChatsItem extends StatelessWidget {
  //final ChatContactController? chatContactController;

  const ChatsItem({
    Key? key,
    //required this.chatContactController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: AppColors.mainColor2,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: buildProfilePhoto(),
        title: Text(
          /*chatContactController?.fullName ??*/ "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        subtitle: Text(
          /*chatContactController?.role ??*/ "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        trailing: SizedBox(
          width: 20,
          child: (/*chatContactController?.unreadMessagesCount ??*/ 0) > 0
              ? CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "${/*chatContactController?.unreadMessagesCount ??*/ 0}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
        onTap: () {
          RouterService.instance.pushNamed(
            path: RouterConstants.chat,
            //data: chatContactController,
          );
        },
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
