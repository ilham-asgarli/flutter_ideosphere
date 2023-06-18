import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/base/models/base_response.dart';
import '../../../models/place.dart';

abstract class MapInterface {
  Future<BaseResponse<Place>> getAddressDetailsFromLatLng(LatLng latLng);
}
