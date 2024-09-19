import 'package:flutter/material.dart';
import 'package:shopping_app/pages/catagories.dart';
import 'package:shopping_app/pages/fevourite.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/profile.dart';

class NavigationVarControllar extends StatefulWidget {
  const NavigationVarControllar({super.key});

  @override
  State<NavigationVarControllar> createState() =>
      _NavigationVarControllarState();
}

class _NavigationVarControllarState extends State<NavigationVarControllar> {
  int index = 0;
  static const List<Widget> _pagename = [
   Home(),
   chart(),
   Fevourite(),
   Profile()
  ];
  void tapindex(sindex) {
    setState(() {
      index = sindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pagename[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: "chart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: "favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "profile"),
        ],
        selectedFontSize: 14,
        unselectedItemColor: Colors.red,
        selectedItemColor: const Color.fromARGB(255, 14, 15, 15),
        onTap: tapindex,
        currentIndex: index,
      ),
    );
  }
}
