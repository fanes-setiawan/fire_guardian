import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
  bool obscureState = true;
  bool isLoading = false; // Status loading

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
  Future<void> doEmailLogin() async {
    try {
      setState(() {
        isLoading = true; // Set status loading menjadi true sebelum login
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (err) {
      print("Login error: ${err.code} - ${err.message}");
      // TODO: Handle login error, show error message to the user
    } catch (err) {
      print("Login error: $err");
      // TODO: Handle login error, show error message to the user
    } finally {
      setState(() {
        isLoading =
            false; // Set status loading menjadi false setelah login selesai
      });
    }
  }
}
