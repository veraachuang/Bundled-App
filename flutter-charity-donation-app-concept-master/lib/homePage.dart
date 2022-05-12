import 'package:codedecoders/screens/explore.dart';
import 'package:codedecoders/screens/heart.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    Heart(),
    Explore(),
    Container(),
    Container(),
    Container(),
  ];

  void onTabTapped(int index){
    setState(() {
     _currentIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        elevation: 0,
        iconSize: 32,

        items: [
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.heart_o),
            label: "Heart"
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.signal),
            label: "Signal",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.bell_o),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}