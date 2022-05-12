import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NgoCard extends StatefulWidget {
  Ngo? ngos;
  //final List<Ngo> ngos;
  Function? onCardClick;

  NgoCard({this.ngos, this.onCardClick});

  @override
  Widget build(BuildContext context, DocumentSnapshot document) {
    return GestureDetector(
        onTap: () {
          this.onCardClick!();
        },
        child: Container(
            margin: EdgeInsets.all(20),
            height: 150,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Text(this.ngos!.ngoName,
                        style: TextStyle(
                            color: Colors
                                .white)), /* Image.asset(
                    'assets/imgs/' + this.ngo!.ngoImg + '.png',
                    fit: BoxFit.cover), */
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.7),
                                Colors.transparent
                              ]))),
                ),
              ],
            )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
