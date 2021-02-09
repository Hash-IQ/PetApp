import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';

LatLng currentPostion;

getUserLocation() async {
  var position = await GeolocatorPlatform.instance
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  currentPostion = LatLng(position.latitude, position.longitude);

  return currentPostion;
}

getUserLocationname() async {
  var position = await GeolocatorPlatform.instance
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  currentPostion = LatLng(position.latitude, position.longitude);
  final coordinates =
      Coordinates(currentPostion.latitude, currentPostion.longitude);
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  return first;
}
