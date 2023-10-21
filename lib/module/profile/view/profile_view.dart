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
          child: const Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/6/6b/Feuerwehreinsatz-gan1.jpg",
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "SATGAS PEMADAM",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Divider(),
                    const ListTile(
                      leading: Icon(Icons.edit),
                      minLeadingWidth: 0.0,
                      title: Text("Edit Profile"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.person_3_rounded),
                      minLeadingWidth: 0.0,
                      title: Text("Detail Profile"),
                      trailing: Icon(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
