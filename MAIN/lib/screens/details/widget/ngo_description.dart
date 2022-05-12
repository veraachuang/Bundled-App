import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:url_launcher/url_launcher.dart';


class NgoDescription extends StatelessWidget {
  final Ngo ngo;
  NgoDescription(this.ngo);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: kDefaultPadding - 15,
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
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              ngo.ngoDescription.join(' '),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
                Container(
                  padding: EdgeInsets.only(
                    bottom: kDefaultPadding - 15,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: kFont,
                        ),
                      ),
                    ],
                  ),
                ),
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
                            Icon(
                              Icons.phone,
                              size: 35,
                            ),
                            Text(
                              ngo.ngoPhone,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
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
                            Icon(
                              Icons.email,
                              size: 35,
                            ),
                            Text(
                              ngo.ngoEmail,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
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
                            Icon(
                              Icons.open_in_new,
                              size: 35,
                            ),
                            InkWell(
                              child: Text(
                                ngo.ngoSite,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onTap: ()=> launch(ngo.ngoSite),
                            ),
                          ],
                        ),
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
