import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;

class DetailProfileView extends StatefulWidget {
  const DetailProfileView({Key? key}) : super(key: key);

  Widget build(context, DetailProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: c.primary,
        centerTitle: true,
        title: Text(
          "Detail Profile",
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
                padding: const EdgeInsets.all(12.0),
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
                    ListTile(
                      leading: Icon(Icons.person_3_rounded),
                      minLeadingWidth: 0.0,
                      title: Text(
                        'Nama',
                      ),
                      trailing: Text(
                        item['username'] ?? '',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      minLeadingWidth: 0.0,
                      title: Text(
                        'Alamat',
                      ),
                      trailing: Text(
                        item['address'] ?? '',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      minLeadingWidth: 0.0,
                      title: Text(
                        'No Tlp',
                      ),
                      trailing: Text(
                        item['phone'] ?? '+62',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email_outlined),
                      minLeadingWidth: 0.0,
                      title: Text('gmail'),
                      trailing: Text(item['email'] ?? ''),
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
  State<DetailProfileView> createState() => DetailProfileController();
}
