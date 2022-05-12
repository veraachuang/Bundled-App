import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/card.dart';
import 'package:flutter_donation_app/models/donate.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/utils.dart';
import '../../constants/constants.dart';
import 'widgets/edu_banner.dart';

class Education extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Education();
}

class _Education extends State<Education> {
  @override
  Widget build(BuildContext context) {
    List<Ngo> ngolist = Utils.getMockedNGOs();
    List<Donate> donate = Utils.getDonation();
    return Scaffold(
        backgroundColor: bColor,
        body: Container(
            child: Column(
          children: [
            EduBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: donate.length,
                itemBuilder: (BuildContext ctx, int index) {
                  if (donate[index].category == 'EDU')
                    return DonationCard(donate: donate[index]);
                  return Text('No offers available');
                },
              ),
            )
          ],
        )));
  }
}
