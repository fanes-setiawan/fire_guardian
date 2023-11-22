import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:fire_guardian/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profil",
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
              return Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: c.primary,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              item["photo"] ??
                                  "https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331257_1280.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['username'] ?? "no name",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.verified,
                              size: 15.0,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Divider(),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfileView()),
                            );
                          },
                          leading: const Icon(Icons.edit),
                          minLeadingWidth: 0.0,
                          title: const Text("Edit Profile"),
                          trailing: const Icon(
                            Icons.chevron_right,
                            size: 24.0,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailProfileView(),
                              ),
                            );
                          },
                          leading: const Icon(Icons.person_3_rounded),
                          minLeadingWidth: 0.0,
                          title: const Text("Detail Profile"),
                          trailing: const Icon(
                            Icons.chevron_right,
                            size: 24.0,
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.settings),
                          minLeadingWidth: 0.0,
                          title: Text("Settings"),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 24.0,
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            controller.doLogout();
                          },
                          leading: Icon(
                            Icons.logout,
                            color: c.red,
                          ),
                          minLeadingWidth: 0.0,
                          title: Text(
                            "Logout",
                            style: TextStyle(color: c.red),
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: c.red,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
