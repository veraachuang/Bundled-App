import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../service/database_service.dart';
import 'ui_view/slider_layout_view.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    Future.delayed(Duration(seconds: 3), () async {
      // await for the Firebase initialization to occur
      FirebaseApp app = await Firebase.initializeApp();

      databaseService.getNgo();
      /* .then((value) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
      }); */
    });

    return Scaffold(
      backgroundColor: bColor,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
