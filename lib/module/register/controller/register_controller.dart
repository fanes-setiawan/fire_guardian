import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  bool obscureState = true;
  bool isLoading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  visibilitySt() {
    obscureState = !obscureState;
    setState(() {});
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
  String username = '';
  String address = '';
  String email = '';
  String password = '';

  register() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = auth.currentUser;
      if (user != null) {
        final FirebaseFirestore db = FirebaseFirestore.instance;
        try {
          await db.collection('users').doc(user.uid).set({
            'username': username,
            'email': email,
            'address': address,
            'id': FirebaseAuth.instance.currentUser!.uid,
          });
        } on Exception catch (err) {
          print(err);
        }
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } on Exception catch (err) {
      print("signup gagal: ${err}");
      bool confirm = false;
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Anda Gagal Melakukan Register'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: c.white,
                ),
                onPressed: () {
                  confirm = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ),
                  );
                },
                child: Text(
                  "yes",
                  style: TextStyle(color: c.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );

      if (confirm) {
        print("Confirmed!");
      }
    }
  }
}
