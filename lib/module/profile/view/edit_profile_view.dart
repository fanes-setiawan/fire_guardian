import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  Widget build(context, EditProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: c.primary,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 18,
            color: c.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot<Object?>>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (!snapshot.hasData) return const Text("No Data");
            Map<String, dynamic> item =
                (snapshot.data!.data() as Map<String, dynamic>);
            item["id"] = snapshot.data!.id;
            return Center(
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    QImagePicker(
                      label: "Image",
                      value: item['photo'] ??
                          "https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331257_1280.png",
                      onChanged: (value) {
                        controller.photo = value;
                      },
                    ),
                    TextFormField(
                      initialValue: item['username'] ?? '',
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "edit your username?",
                      ),
                      onChanged: (value) {
                        controller.username = value;
                      },
                    ),
                    TextFormField(
                      initialValue: item['address'] ?? '',
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "edit your address?",
                      ),
                      onChanged: (value) {
                        controller.address = value;
                      },
                    ),
                    TextFormField(
                      initialValue: item['phone'] ?? '+62',
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "edit your phone number?",
                      ),
                      onChanged: (value) {
                        controller.phone = value;
                      },
                    ),
                    TextFormField(
                      initialValue: item['email'] ?? '',
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "edit your email?",
                      ),
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 25),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.save_as_rounded,
                        color: c.white,
                      ),
                      label: Text(
                        "Save",
                        style: TextStyle(color: c.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: c.primary,
                      ),
                      onPressed: () async {
                        controller.doSave(item);
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  State<EditProfileView> createState() => EditProfileController();
}
