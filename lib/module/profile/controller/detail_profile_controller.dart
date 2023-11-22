import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../view/detail_profile_view.dart';

class DetailProfileController extends State<DetailProfileView> {
  static late DetailProfileController instance;
  late DetailProfileView view;

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
