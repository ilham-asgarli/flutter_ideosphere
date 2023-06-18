import 'package:flutter/material.dart';

import '../../../../../../data/models/event.dart';
import '../components/event_item.dart';

class EventView extends StatelessWidget {
  final Event eventModel;

  const EventView({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventItem(eventModel: eventModel),
    );
  }
}
