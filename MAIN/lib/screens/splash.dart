import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/service/database_service.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;
  String? goToPage;

  SplashPage({this.goToPage, this.duration});

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    Future.delayed(Duration(seconds: this.duration!), () async {
      // await for the Firebase initialization to occur
      FirebaseApp app = await Firebase.initializeApp();

      databaseService.getNgo();
      /* .then((value) {
        Utils.mainAppNav.currentState!.pushNamed(this.goToPage!);
      }); */
    });

    return Material(
        child: Container(
            color: bColor,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  child: Image.asset('assets/images/aldenLOGO.png',
                      width: 100, height: 100),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )));
  }
}
