import 'package:flutter/material.dart';

class StartEventView extends StatelessWidget {
  const StartEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CircleAvatar(),
      ),
    );
  }
}
