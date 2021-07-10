import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int _index) {
        setState(() {
          index = _index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/BottomAppBarProfile.png",
              scale: 3,
            ),
            label: "Profile"),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/BottomAppBarWallet.png", scale: 3),
          label: "Wallet",
        ),
        //BottomNavigationBarItem(icon: Container(), label: ""),
        BottomNavigationBarItem(
            icon:
                Image.asset("assets/images/BottomAppBarpedestal.png", scale: 3),
            label: "Leader Board"),
        BottomNavigationBarItem(
            icon:
                Image.asset("assets/images/BottomAppBarsettings.png", scale: 3),
            label: "Settings"),
      ],
    );
  }
}
