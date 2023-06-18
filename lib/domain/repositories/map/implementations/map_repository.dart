import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/base/models/base_success.dart';
import '../../../../data/data-sources/map/implementations/map_data_source.dart';
import '../../../../data/models/place.dart';
import '../interfaces/map_interface.dart';

class MapRepository extends MapInterface {
  final MapDataSource mapDataSource = MapDataSource();

  @override
  Future<Place> getAddressDetailsFromLatLng(LatLng latLng) async {
    final response = await mapDataSource.getAddressDetailsFromLatLng(latLng);

    if (response is BaseSuccess<Place>) {
      return response.data;
    }

    throw Error();
  }
}
