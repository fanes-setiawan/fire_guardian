import 'package:flutter/material.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:fire_guardian/core.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<MapsView> createState() => MapsController();
}
