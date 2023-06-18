import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../core/base/models/base_response.dart';
import '../../../../core/base/models/base_success.dart';
import '../../../../utils/logic/constants/api/api_url_constants.dart';
import '../../../../utils/logic/constants/env/env_constants.dart';
import '../../../models/place.dart';
import '../interfaces/map_interface.dart';

class MapDataSource extends MapInterface {
  @override
  Future<BaseResponse<Place>> getAddressDetailsFromLatLng(LatLng latLng) async {
    final String request =
        '${ApiUrlConstants.geocodingBaseUrl}?latlng=${latLng.latitude},${latLng.longitude}&key=${dotenv.env[EnvConstants.googleMapsApiKey]}'; //&fields=address_component
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['results'][0]['address_components'] as List<dynamic>;
        final place = Place();

        place.formattedAddress = result['results'][0]["formatted_address"];

        for (var c in components) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('administrative_area_level_4')) {
            place.quarter = c['long_name'];
          }
          if (type.contains('administrative_area_level_2')) {
            place.district = c['long_name'];
          }
          if (type.contains('administrative_area_level_1')) {
            place.city = c['long_name'];
          }
          if (type.contains('country')) {
            place.country = c['long_name'];
            place.countryCode = c['short_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }

          final location = result['results'][0]['geometry']['location'];
          place.lat = location['lat'];
          place.lng = location['lng'];
        }

        if (place.city == null) {
          if (place.district != null) {
            place.city = place.district;
          } else if (place.quarter != null) {
            place.city = place.quarter;
          }
        }

        return BaseSuccess(data: place);
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch');
    }
  }
}
