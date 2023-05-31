import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTabScreen extends StatefulWidget {
  const MapTabScreen({Key? key}) : super(key: key);

  @override
  _MapTabScreenState createState() => _MapTabScreenState();
}

class _MapTabScreenState extends State<MapTabScreen> {
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: LatLng(37.4537251, 126.7960716)));
  }

  @override
  Widget build(BuildContext context) {
    // var markers;
    return GoogleMap(
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      markers: Set.from(_markers),
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.5035, 126.961),
        zoom: 14,
      ),
      cameraTargetBounds: CameraTargetBounds(LatLngBounds(
        southwest: const LatLng(33, 124),
        northeast: const LatLng(39, 132),
      )), //카메라 이동 제한(대한민국으로 특정)
      minMaxZoomPreference: MinMaxZoomPreference(10, 18), //최소, 최대 줌
      myLocationButtonEnabled: true, //내 위치 버튼
      myLocationEnabled: true, //내 위치
      gestureRecognizers: Set() //제스처 인식
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
      //현재 위치 알려주는 버튼
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

class _controller {
  static complete(GoogleMapController controller) {}
}
