import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/models/place.dart';

abstract class MapInterface {
  Future<Place> getAddressDetailsFromLatLng(LatLng latLng);
}
