import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/card.dart';
import 'package:flutter_donation_app/models/donate.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/models/offerscard.dart';
import 'package:flutter_donation_app/utils.dart';
import '../../constants/constants.dart';
import 'widgets/offer_banner.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Offers();
}

class _Offers extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    List<Ngo> ngolist = Utils.getMockedNGOs();
    List<Donate> donate = Utils.getDonation();
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
            child: Column(
          children: [
            OfferBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: donate.length,
                itemBuilder: (BuildContext ctx, int index) {
                  //if (donate[index].category == 'EDU')
                    return OfferCard(donate: donate[index]);
                  //return Text('No offers available');
                },
              ),
            )
          ],
        )));
  }
}
