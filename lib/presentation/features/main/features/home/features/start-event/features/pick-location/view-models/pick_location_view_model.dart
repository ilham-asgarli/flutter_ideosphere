import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../../../../data/models/place.dart';
import '../../../../../../../../../../domain/repositories/map/implementations/map_repository.dart';
import '../state/pick_location_cubit.dart';

class PickLocationViewModel {
  final PickLocationCubit pickLocationCubit;

  PickLocationViewModel(this.pickLocationCubit);

  late final GoogleMapController googleMapController;
  final MapRepository mapRepository = MapRepository();

  void onCameraIdle() async {
    LatLngBounds visibleRegion = await googleMapController.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );

    Place place = await mapRepository.getAddressDetailsFromLatLng(centerLatLng);
    pickLocationCubit.changePlace(place);
  }
}
