import 'package:android_food_waste_management/account.dart';
import 'package:android_food_waste_management/home.dart';
import 'package:flutter/material.dart';

class AppHolder extends StatefulWidget {
  const AppHolder({super.key});

  @override
  State<AppHolder> createState() => _AppHolderState();
}

class _AppHolderState extends State<AppHolder> {
  int selectedIndex = 0;

  void navigate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomePage(),
    const AcountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: selectedIndex,
            elevation: 0,
            onTap: navigate,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_max), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage_rounded),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
