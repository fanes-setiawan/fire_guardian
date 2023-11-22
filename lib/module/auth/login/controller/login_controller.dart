import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
  bool obscureState = true;
  bool isLoading = false;

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
  String? email;
  String? password;
  doEmailLogin() async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (err) {
      print("Login error: ${err.code} - ${err.message}");
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Masukan email dan password dengan benar'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: c.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
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
    } catch (err) {
      print("Login error: $err");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
