import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTabScreen extends StatelessWidget {
  const MapTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.5035, 126.961),
          zoom: 14,
        ),
        // onMapCreated: ,
      ),
    );
  }

}
