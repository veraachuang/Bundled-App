import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/ngo_register_confirm/widget/ngo_register_confirm_banner.dart';
import 'package:flutter_donation_app/screens/ngo_register_confirm/widget/ngo_register_confirm_body.dart';
import 'package:flutter_donation_app/screens/update_account_ngo_screen/update_account_ngo.dart';

class NgoRegisterConfirmPage extends StatefulWidget {
  final Ngo ngo;
  NgoRegisterConfirmPage(this.ngo);

  @override
  _NgoRegisterConfirmPageState createState() => _NgoRegisterConfirmPageState(ngo);
}

class _NgoRegisterConfirmPageState extends State<NgoRegisterConfirmPage> {
  final Ngo ngo;
  _NgoRegisterConfirmPageState(this.ngo);
  int currentlyIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentlyIndex = index;
    });

    if (currentlyIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UpdateNgoPage(ngo)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            NgoRegisterConfirmBanner(),
            NgoRegisterConfirmBody(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentlyIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackgroundColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          label: 'home',
          icon: Image.asset('assets/icons/home.png', width: 25),
        ),
        BottomNavigationBarItem(
          label: 'user',
          icon: Image.asset('assets/icons/user.png', width: 25),
        ),
      ],
    );
  }
}
