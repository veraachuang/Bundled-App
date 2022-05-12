import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/card.dart';
import 'package:flutter_donation_app/models/donate.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/recreation/widgets/recre_banner.dart';
import 'package:flutter_donation_app/utils.dart';
import '../../constants/constants.dart';


class Recreation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Recreation();
}

class _Recreation extends State<Recreation> {
  @override
  Widget build(BuildContext context) {
    List<Ngo> ngolist = Utils.getMockedNGOs();
    List<Donate> donate = Utils.getDonation();
    return Scaffold(
        backgroundColor: bColor,
        body: Container(
            child: Column(
          children: [
            RecreBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: donate.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return DonationCard(donate: donate[index]);
                },
              ),
            )
          ],
        )));
  }
}
