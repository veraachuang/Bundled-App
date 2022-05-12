import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/donate_confirm/donate_confirm.dart';

class DonateInformations extends StatelessWidget {
  final Ngo ngo;
  DonateInformations(this.ngo);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: kDefaultPadding,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        ngo.ngoName,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: kFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 5,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Choose an NGO below to make a donation:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Pix:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  ngo.ngoPix,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Banco:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  'NGO NAME',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Conta:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  'NGO BANK ACCOUNT',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Agência:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  'NGO BANK ACCOUNT',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: kDefaultPadding - 5,
                    ),
                    height: 65,
                    width: 335,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonDonatePrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DonateConfirmScreen()));
                      },
                      child: Text(
                        'Pronto',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
