import 'package:flutter/material.dart';

import '../components/event_item.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventItem(),
    );
  }
}
