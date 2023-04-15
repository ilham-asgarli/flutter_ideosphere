import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../geolocator/geolocator_helper.dart';

class GoogleMapsHelper {
  static final GoogleMapsHelper instance = GoogleMapsHelper._init();

  GoogleMapsHelper._init();

  Future<Position> animateCameraToMyLocation(
      GoogleMapController controller) async {
    Position position = await GeolocatorHelper.instance.determinePosition();
    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
    return position;
  }
}
