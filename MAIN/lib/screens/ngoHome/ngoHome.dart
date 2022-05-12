import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/auth_page.dart';
import 'package:flutter_donation_app/screens/home/widget/explore.dart';
import 'package:flutter_donation_app/screens/home/widget/list_title.dart';
import 'package:flutter_donation_app/screens/home/widget/ngo_item.dart';
import 'package:flutter_donation_app/screens/home/widget/ngo_scroller.dart';
import 'package:flutter_donation_app/screens/home/widget/ngo_list.dart';
import 'package:flutter_donation_app/service/database_service.dart';
import 'package:flutter_donation_app/service/http_service.dart';
import 'package:provider/provider.dart';

import 'widgets/add_item.dart';
import 'widgets/ngo_top_bar.dart';

class NgoHomeScreen extends StatefulWidget {
  @override
  _NgoHomeScreenState createState() => _NgoHomeScreenState();
}

class _NgoHomeScreenState extends State<NgoHomeScreen> {
  final HttpService httpService = HttpService();
  

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NgoTopBar(),
                      LimitedBox(
                        maxHeight: MediaQuery.of(context).size.height - 650,
                        child: Scroller(),
                      ),
                      Positioned(
                        bottom: 0,
                        child: LimitedBox(
                          maxHeight: MediaQuery.of(context).size.height - 650,
                          child: AddItem(),
                        ),
                      ),
                      //ListTitle('the NGO list'),
                      /* LimitedBox(
                        maxHeight: 200,
                        child: NgoList(),
                      ), */
                    ],
                  ),
                );
              } else {
                return AuthPage();
              }
            }));
  }

}
