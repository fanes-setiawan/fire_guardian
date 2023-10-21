import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../../../global_widget/form_widget/text_field_widget.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: c.gradientRed,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 20.0,
                  color: c.whiteText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFieldWidget(
                hintText: "Name",
                helperText: "enter your name",
                obscureText: false,
                onPressed: (value) {
                  controller.email = value;
                },
              ),
              TextFieldWidget(
                hintText: "Addess",
                helperText: "enter your addess",
                obscureText: false,
                onPressed: (value) {
                  controller.email = value;
                },
              ),
              TextFieldWidget(
                hintText: "Email",
                helperText: "enter your email",
                obscureText: false,
                onPressed: (value) {
                  controller.email = value;
                },
              ),
              TextFieldWidget(
                hintText: "Password",
                helperText: "enter your password",
                obscureText: controller.obscureState,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.visibilitySt();
                  },
                  icon: Icon(
                    controller.obscureState
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                onPressed: (value) {
                  controller.password = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: c.primary,
                  onPrimary: c.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      color: c.whiteText, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "sudah punya akun? ",
                    style: TextStyle(
                      color: c.greyText,
                      fontSize: 14.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: c.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
