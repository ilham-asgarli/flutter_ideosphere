import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extension.dart';
import '../../../../data/models/event.dart';

class EventOrganizer extends StatelessWidget {
  final Event eventModel;

  const EventOrganizer({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
              "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            getName(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String getName() {
    if (eventModel.organizer.customer != null) {
      return "${eventModel.organizer.customer?.firstname ?? ""} ${eventModel.organizer.customer?.lastname ?? ""}";
    } else if (eventModel.organizer.company != null) {
      return eventModel.organizer.company?.name ?? "";
    } else {
      return "";
    }
  }
}
