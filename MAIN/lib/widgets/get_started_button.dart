// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/first_screen/first_screen.dart';
import '../constants/constants.dart';

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100.0,
      width: 140.0,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(27.0),
          
        ),),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => FirstPage()));
        },
        
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Text(
            "GET STARTED",
            style: TextStyle(
              fontFamily: POPPINS,
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        )),
      ),
    );
  }
}