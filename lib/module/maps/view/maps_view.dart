import 'package:flutter/material.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:fire_guardian/core.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../controller/maps_controller.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  Widget build(context, MapsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Maps",
          style: TextStyle(
            fontSize: 18,
            color: c.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(-6.8862572, 107.5236119), //Kota Cimahi
          zoom: 9,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(-6.9051823, 107.1740212),
                width: 50,
                height: 50,
                builder: (context) =>
                    Image.asset('assets/icons/icons-fire.png'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  State<MapsView> createState() => MapsController();
}
