import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../state/cubit/home_cubit.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state.markerId == "") {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: context.paddingLow,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.mainColor2,
            ),
            child: Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: context.watch<HomeCubit>().state.markerId == ""
                        ? 0
                        : null,
                    width: double.infinity,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        children: [
                          Text(
                            "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
                          ),
                          Text(
                            "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
                          ),
                          Text(
                            "ıwlcnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnfuqb4ıqcuwotqcu44444444444444444444444",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
