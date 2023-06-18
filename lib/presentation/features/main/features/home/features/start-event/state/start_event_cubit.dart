import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../view-models/start_event_view_model.dart';

part 'start_event_state.dart';

class StartEventCubit extends Cubit<StartEventState> {
  final BuildContext context;

  StartEventCubit(this.context) : super(StartEventState()) {
    startEventViewModel = StartEventViewModel(this, context);
  }

  late final StartEventViewModel startEventViewModel;

  changeCreating(bool creating) {
    emit(state.copyWith(creating: creating));
  }
}
