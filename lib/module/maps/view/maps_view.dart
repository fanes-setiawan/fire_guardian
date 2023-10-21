import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../controller/maps_controller.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  Widget build(context, MapsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<MapsView> createState() => MapsController();
}
