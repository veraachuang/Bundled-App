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
import 'package:flutter_donation_app/screens/home/widget/top_bar.dart';
import 'package:flutter_donation_app/service/database_service.dart';
import 'package:flutter_donation_app/service/http_service.dart';
import 'package:provider/provider.dart';

class DonorHomeScreen extends StatefulWidget {
  @override
  _DonorHomeScreenState createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
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
                      TopBar(),
                      LimitedBox(
                        maxHeight: MediaQuery.of(context).size.height - 650,
                        child: Scroller(),
                      ),
                      ListTitle('the NGO list'),
                      LimitedBox(
                        maxHeight: 200,
                        child: NgoList(),
                      ),

                      /* FutureBuilder(
                future: httpService.fetchNgos(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Ngo>> snapshot) {
                  if (snapshot.hasData) {
                    List<Ngo>? posts = snapshot.data;
                    print("Trying to assemble components... ");
                    var listView = ListView(
                      children:
                          posts!.map((Ngo ngo) => NgoItem(ngo)).toList(),
                    );
                    return Expanded(
                      child: listView,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }), */
                    ],
                  ),
                );
              } else {
                return AuthPage();
              }
            }));
  }

}
