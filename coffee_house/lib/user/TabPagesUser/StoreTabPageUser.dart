// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, file_names
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreTabPageUser extends StatelessWidget {
  const StoreTabPageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.422, -122.084),
              zoom: 15.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('storeLocation'),
                position: LatLng(37.422, -122.084),
                infoWindow: InfoWindow(title: 'Store Location'),
              ),
            },
          ),
        ),
        Divider(
          height: 2.0,
          thickness: 2.0,
        ),
      ],
    );
  }
}