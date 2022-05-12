import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/clothes/clothes_screen.dart';
import 'package:flutter_donation_app/screens/dailynec/dailynec_screen.dart';
import 'dart:math';

import 'package:flutter_donation_app/screens/education/education_screen.dart';
import 'package:flutter_donation_app/screens/electronics/electronics_screen.dart';
import 'package:flutter_donation_app/screens/recreation/recreation_screen.dart';

import '../../../models/ngo.dart';
import '../../../service/database_service.dart';
import '../../details/ngo_details.dart';

const SCALE_FRACTION = 0.9;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 150.0;

class Scroller extends StatefulWidget {
  @override
  _ScrollerPageState createState() => _ScrollerPageState();
}

class _ScrollerPageState extends State<Scroller> {
  Ngo? ngo;

  double viewPortFraction = 0.5;

  late PageController pageController;

  int currentPage = 2;

  List<Map<String, String>> listOfCharacters = [
    {'image': "assets/images/edu.png", 'name': "Education"},
    {'image': "assets/images/recre.png", 'name': "Recreation"},
    {'image': "assets/images/elec.png", 'name': "Electronics"},
    {'image': "assets/images/daily.png", 'name': "Daily Necessities"},
    {'image': "assets/images/cloth.png", 'name': "Clothes"}
  ];

  double page = 2.0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: PAGER_HEIGHT,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  setState(() {
                    page = pageController.page!;
                  });
                }
                return false;
              },
              child: MediaQuery.removePadding(
                context: context,
                removeLeft: true,
                child: PageView.builder(
                  onPageChanged: (pos) {
                    setState(() {
                      currentPage = pos;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: listOfCharacters.length,
                  itemBuilder: (context, index) {
                    final scale = max(SCALE_FRACTION,
                        (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return circleOffer(listOfCharacters[index]['image']!, scale);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            /* child: Text(
                  listOfCharacters[currentPage]['name']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ), */
          ),
        ],
      ),
    );
  }

  /* StreamBuilder<QuerySnapshot> getPage() {
    final DatabaseService service = DatabaseService();
    return StreamBuilder<QuerySnapshot>(
        stream: service.getStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            Ngo ngo = documents as Ngo;
            return ngo.;
          }
        });
  } */

  Widget circleOffer(String image, double scale) {
    /* final DatabaseService service = DatabaseService();
    Ngo NGO = service.getStream() as Ngo; */

    /* Ngo mockngo = Mock.getMockedData() as Ngo; */

    return Align(
      //alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: PAGER_HEIGHT * scale,
        width: PAGER_HEIGHT * scale,
        child: GestureDetector(
          onTap: () => {
            if (listOfCharacters[currentPage]['name'] == 'Education')
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            /* NgoDetails(mockngo)  */Education()))
              }
            else if (listOfCharacters[currentPage]['name'] == 'Recreation')
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Recreation()))
              }
            else if (listOfCharacters[currentPage]['name'] == 'Electronics')
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Electronics()))
              }
            else if (listOfCharacters[currentPage]['name'] ==
                'Daily Necessities')
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DailyNec()))
              }
            else if (listOfCharacters[currentPage]['name'] == 'Clothes')
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Clothes()))
              }
          },
          child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
