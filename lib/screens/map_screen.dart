import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moonshine_fe/apis/geolocation.dart';

class MapScreen extends StatefulWidget {
  final Geolocation geolocation;
  const MapScreen({
    super.key,
    required this.geolocation,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Marker> _markers = [];
  final Completer<GoogleMapController> _controller = Completer();

  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _markers.add(
      Marker(
        markerId: const MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: const LatLng(37.4537251, 126.7960716),
      ),
    );
  }

  _getCurrentLocation() async {
    // Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    //     .then((Position position) {
    //   setState(() {
    //     _currentPosition = position;
    //   });
    // }).catchError((e) {
    //   print(e);
    // });

    await widget.geolocation.getCurrentPosition().then((position) {
      _currentPosition = position!;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            markers: Set.from(_markers),
            initialCameraPosition: CameraPosition(
              target: LatLng(
                _currentPosition != null
                    ? _currentPosition!.latitude
                    : 37.5036383,
                _currentPosition != null
                    ? _currentPosition!.longitude
                    : 126.9570617,
              ),
              zoom: 14,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                southwest: const LatLng(33, 124),
                northeast: const LatLng(39, 132),
              ),
            ),
            minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
            gestureRecognizers: {}..add(
                Factory<PanGestureRecognizer>(
                  () => PanGestureRecognizer(),
                ),
              ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                  _currentPosition != null
                      ? _currentPosition!.latitude
                      : 37.5036383,
                  _currentPosition != null
                      ? _currentPosition!.longitude
                      : 126.9570617,
                ),
                zoom: 14,
              ),
            ),
          );
        },
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
