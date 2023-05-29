// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapTabScreen extends StatelessWidget {
//   const MapTabScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(37.5035, 126.961),
//           zoom: 14,
//         ),
//         // onMapCreated: ,
//       ),
//     );
//   }

// }

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../map_src/locations.dart' as locations;

class MapTabScreen extends StatefulWidget {
  const MapTabScreen({Key? key}) : super(key: key);

  @override
  _MapTabScreenState createState() => _MapTabScreenState();
}

class _MapTabScreenState extends State<MapTabScreen> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        zoomGesturesEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.5035, 126.961),
          zoom: 14,
        ),
        myLocationButtonEnabled: true,
        markers: _markers.values.toSet(),
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
      ),
    );
  }
}
