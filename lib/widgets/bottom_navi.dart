import 'package:flutter/material.dart';
import 'package:k2/screens/home_screen.dart';

import '../screens/login_screen.dart';

class BottomNavi extends StatelessWidget {
  const BottomNavi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 1) {
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        if (value == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
      ],
      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      // onTap: _onItemTapped,
    );
  }
}
