import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Geolocation {
  Position? _currentPosition;
  String? _currentAddress;

  Geolocation();

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    print('Geolocation _handleLocationPermission() executed');

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<Position?> getCurrentPosition() async {
    print('Geolocation getCurrentPosition() executed');

    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return null;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      // setState(() => _currentPosition = position);
      _currentPosition = position;
      // _getAddressFromLatLng(_currentPosition!);
      print(_currentPosition);
      return _currentPosition;
    }).catchError((e) {
      // debugPrint(e);
      print('_getCurrentPosition catchError');
      print(e.toString());
    });
    return _currentPosition;
  }

  Future<String?> getAddressFromLatLng() async {
    print('Geolocation getAddressFromLatLng() executed');

    if (_currentPosition == null) {
      await getCurrentPosition();
    }

    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      // setState(() {
      //   _currentAddress =
      //       '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      print(_currentAddress);
      return _currentAddress;
    }).catchError((e) {
      // debugPrint(e);
      print('_getAddressFromLatLng catchError');
      print(e.toString());
    });
    return _currentAddress;
  }
}
