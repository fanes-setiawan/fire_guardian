import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fire_guardian/core.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    MapsView(),
    HistoryView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        child: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: c.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.map_outlined),
              title: const Text('Location'),
              activeColor: c.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.history_rounded),
              title: const Text(
                'Riwayat',
              ),
              activeColor: c.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profil'),
              activeColor: c.primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
