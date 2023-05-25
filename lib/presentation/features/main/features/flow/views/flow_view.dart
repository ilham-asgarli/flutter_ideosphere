import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return const EventItem();
              },
            ),
          ),
          (context.lowValue * 2 + 50).verticalSpace,
        ],
      ),
    );
  }
}
