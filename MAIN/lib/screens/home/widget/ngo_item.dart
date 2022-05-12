import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';

import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/details/ngo_details.dart';
import 'package:flutter_donation_app/screens/donate/donate.dart';

class NgoItem extends StatelessWidget {
  final Ngo ngo;
  NgoItem(this.ngo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: kDefaultPadding, bottom: kDefaultPadding - 10),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 160,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:
                            Image.asset(ngo.ngoImg, fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            width: 200,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 12,
                          left: kDefaultPadding - 8,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'ngoName',//ngo.ngoName,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        height: 60,
                        padding: EdgeInsets.only(
                          left: kDefaultPadding - 8,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'description',
                                //ngo.ngoDescription.join(""),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kFont,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 170,
                  padding: EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: kFontLight),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NgoDetails(ngo)));
                            },
                            child: Text('Learn more +',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ))),
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kButtonDonatePrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DonateDetails(ngo)));
                            },
                            child: Text('Donate',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
