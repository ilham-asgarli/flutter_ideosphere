import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../state/cubit/home_cubit.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: context.watch<HomeCubit>().state.markerId.isNotEmpty ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: context.watch<HomeCubit>().state.markerId.isNotEmpty ? 200 : 0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.mainColor2,
          child: Center(
            child: Text(
              "${context.watch<HomeCubit>().state.markerId}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
