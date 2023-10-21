import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../view/maps_view.dart';

class MapsController extends State<MapsView> {
  static late MapsController instance;
  late MapsView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
