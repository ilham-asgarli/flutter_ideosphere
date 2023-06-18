import 'package:bloc/bloc.dart';

import '../../../../../../../../../../data/models/place.dart';
import '../view-models/pick_location_view_model.dart';

part 'pick_location_state.dart';

class PickLocationCubit extends Cubit<PickLocationState> {
  PickLocationCubit() : super(const PickLocationState()) {
    pickLocationViewModel = PickLocationViewModel(this);
  }

  late final PickLocationViewModel pickLocationViewModel;

  void changePlace(Place? place) {
    emit(state.copyWith(
      place: place,
    ));
  }
}
