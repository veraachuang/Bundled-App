import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'donate.dart';

class Tag extends StatelessWidget {
  Donate donate;
  Color color;
  int no;
  Tag({required this.donate, required this.color, required this.no});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(3),
          color: this.color,
          /* decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: bColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3)
              )
            ]
          ), */
          child: Text(
            this.donate.condition[no],
            style: TextStyle(
                color: kFont,
                fontSize: 12,
                //letterSpacing: 1.5,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
