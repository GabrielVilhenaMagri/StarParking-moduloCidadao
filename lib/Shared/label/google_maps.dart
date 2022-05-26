import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker> ();
  double lat = 45.512563;
  double long = -122.677433;

  void _onMapCreated(GoogleMapController controller){
    mapController  = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            onSubmitted: (val){
              print(val);
            },
          ),
        ),
        Container(
          child: GoogleMap(
              onMapCreated: _onMapCreated,
               onCameraMove: (data) {
                print(data);
               },
            onTap: (position){
                print(position);
            },
               initialCameraPosition: CameraPosition(
                 target: LatLng(lat,long),
                 zoom:1.0,
               ),
            markers: markers,
          ),
        ),
      ],
    );
  }
}