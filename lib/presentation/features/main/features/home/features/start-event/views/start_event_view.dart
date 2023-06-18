import 'package:flutter/material.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../components/start_event_form.dart';

class StartEventView extends StatelessWidget {
  const StartEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Etkinlik başlat"),
          titleSpacing: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormal,
            child: const StartEventForm(),
          ),
        ),
      ),
    );
  }
}
