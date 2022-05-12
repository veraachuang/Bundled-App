import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../ngoHome.dart';

class NgoMenu extends StatefulWidget {
  const NgoMenu({Key? key}) : super(key: key);

  @override
  State<NgoMenu> createState() => _NgoMenuState();
}

class _NgoMenuState extends State<NgoMenu> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Shopping Bag',
      style: optionStyle,
    ),
    Text(
      'Index 2: Chat',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        PageView(
          controller: pageController,
          children: [
            NgoHomeScreen(),
            //Offers(),


          ],
        ),
        //child: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: /* SizedBox(
        height: 90, 
        child:*/
          BottomNavigationBar(
            elevation: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', //Home
          ),
          /* BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ), */
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '', //Profile
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: '', //Profile
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '', //Profile
          ),

        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: kTextColor,
        selectedItemColor: kButtonPrimary,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
