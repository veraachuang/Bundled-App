import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/donate/Widget/upload.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../service/database_service.dart';
import 'donate.dart';
import 'ngo.dart';

class OfferCard extends StatelessWidget {
  //Ngo ngo;

  Donate donate;

  OfferCard({required this.donate});

  @override
  Widget build(BuildContext context) {
    final DatabaseService service = DatabaseService();

    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(bottom:15, left:15, right:15),
      decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2.0,
                        offset: Offset(0, 0.40))
                  ],
                  color: donationBox,
                  borderRadius: BorderRadius.circular(20
                  ),),
      height: 80,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(color: donationBox)),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(this.donate.ngoImg,
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Positioned(
                    top: 0,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Your donation:',
                              style: TextStyle(
                                  color: kFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* Row(
                    children: [
                      Positioned(
                        top: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Condition:',
                              style: TextStyle(
                                  color: kFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), */
                  Row(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'NGO:',
                            style: TextStyle(
                                color: kFont,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //user inputs
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                          width: 150,
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    this.donate.itemName,
                                    style: TextStyle(color: kFont, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  /* Container(
                    padding: EdgeInsets.only(left: 5),
                    width: 110,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: <Widget> [
                            if(this.donate.condition[0] == 'NEW') 
                              Container(
                                  padding: EdgeInsets.only(top:5, bottom:5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      color: tagYellow,
                                      child: Text(
                                        this.donate.condition[0],
                                        style: TextStyle(
                                          color: kFont, 
                                          fontSize: 12,
                                          //letterSpacing: 1.5, 
                                          fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                            if(this.donate.condition[1] == 'SLIGHTLY USED') Container(
                                  padding: EdgeInsets.only(top:5, bottom:5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      color: tagGreen,
                                      child: Text(
                                        this.donate.condition[1],
                                        style: TextStyle(
                                          color: kFont, 
                                          fontSize: 12,
                                          //letterSpacing: 1.5, 
                                          fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                            if(this.donate.condition[2] == 'HEAVILY USED') Container(
                                  padding: EdgeInsets.only(top:5, bottom:5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      color: tagBlue,
                                      child: Text(
                                        this.donate.condition[2],
                                        style: TextStyle(
                                          color: kFont, 
                                          fontSize: 12,
                                          //letterSpacing: 1.5, 
                                          fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                    ),
                  ), */
                  Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          this.donate.ngoName,
                          style: TextStyle(color: kFont, fontSize: 15),
                        ),
                      ),
                  
                  

                ],
              ),
            ],
          ),
          /* Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Positioned(
                top: MediaQuery.of(context).padding.top + 15,
                left: 20,
                child: Container(
                  height: 40,
                  width: 40,
                  //padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: kFontDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                    onPressed: () => Navigator.of(context)
                      ..push(MaterialPageRoute(
                          builder: (context) => ImageUpload())),
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
