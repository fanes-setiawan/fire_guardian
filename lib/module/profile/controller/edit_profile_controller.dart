import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../view/edit_profile_view.dart';

class EditProfileController extends State<EditProfileView> {
  static late EditProfileController instance;
  late EditProfileView view;
  String? photo;
  String? username;
  String? phone;
  String? email;
  String? address;
  bool isLoading = false;

  doSave(oldValue) async {
    setState(() {
      isLoading = true;
    });
    phone = photo ?? oldValue['photo'];
    username = username ?? oldValue['username'];
    email = email ?? oldValue['email'];
    address = address ?? oldValue['address'];
    phone = phone ?? oldValue['phone'];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'photo': photo,
        'username': username,
        'phone': phone,
        'address': address,
        'email': email,
      },
    );
    setState(() {
      isLoading = false;
    });
  }

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
