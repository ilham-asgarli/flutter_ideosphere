import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/logic/constants/enums/app_enum.dart';
import '../components/event-item/event_item.dart';
import '../state/event_cubit.dart';

class EventView extends StatelessWidget {
  const EventView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventItem(
        eventModel: context.read<EventCubit>().eventModel,
        event: EventType.closeEvent,
      ),
    );
  }
}
