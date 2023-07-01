import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AmbulanceBooking extends StatefulWidget {
  const AmbulanceBooking({Key? key}) : super(key: key);

  @override
  State<AmbulanceBooking> createState() => _AmbulanceBookingState();
}

class _AmbulanceBookingState extends State<AmbulanceBooking> {
  @override
  Widget build(BuildContext context) {
    var color  = Colors.white;
    return Container(
      color: color,
      child: MapScreen(),
    );
  }

}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  late Position currentPosition;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print('Location permissions are denied (actual value: $permission).');
        return;
      }
    }

    currentPosition = await Geolocator.getCurrentPosition();

    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 14.0,
      ),
    ));

    fetchNearbyHospitals();
  }

  void fetchNearbyHospitals() async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=${currentPosition.latitude},${currentPosition.longitude}&'
        'radius=5000&'
        'type=hospital&'
        'key=YOUR_API_KEY'; // Replace with your API key

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['status'] == 'OK') {
      final List<dynamic> results = data['results'];
      markers = results.map((result) {
        final lat = result['geometry']['location']['lat'];
        final lng = result['geometry']['location']['lng'];
        final name = result['name'];
        final vicinity = result['vicinity'];

        return Marker(
          markerId: MarkerId(result['place_id']),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title: name,
            snippet: vicinity,
          ),
        );
      }).toList();
    } else {
      print('Failed to fetch hospitals.');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Google Maps Demo'),
      // ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers.toSet(),
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 14.0,
        ),
      ),
    );
  }
}