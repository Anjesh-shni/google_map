import 'package:flutter/material.dart';

import 'mainfood_page.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  List pages = [
    const MainFoodPage(),
    const Center(
      child: Text("Cart"),
    ),
    const Center(
      child: Text("Profiles"),
    ),
  ];
 

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.grey.shade700,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profiles",
          ),
        ],
      ),
    );
  }
}
