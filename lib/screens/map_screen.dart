import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: const MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: const LatLng(37.4537251, 126.7960716)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(children: [
        GoogleMap(
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
          minMaxZoomPreference: const MinMaxZoomPreference(10, 18), //최소, 최대 줌
          myLocationButtonEnabled: true, //내 위치 버튼
          myLocationEnabled: true, //내 위치
          gestureRecognizers: {} //제스처 인식
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
          //현재 위치 알려주는 버튼
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ]),
    );
  }
}

class _controller {
  static complete(GoogleMapController controller) {}
}
