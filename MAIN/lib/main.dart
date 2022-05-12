import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_donation_app/screens/create_account_donor_screen.dart/create_donor_screen.dart';

import 'package:flutter_donation_app/screens/landing/landing_page.dart';
import 'package:flutter_donation_app/screens/ngoHome/ngoHome.dart';
import 'package:flutter_donation_app/service/database_service.dart';
//import 'package:flutter_donation_app/screens/splash_screen/splash.dart';
import 'package:flutter_donation_app/utils.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';

import 'models/ngo.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(providers: [
    Provider(
      create: (_) => DatabaseService(),
    )
  ], child: BundledApp()));

  FlutterNativeSplash.remove();
}

class BundledApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Ngo> ngoMock = Utils.getMockedNGOs();

    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    databaseService.getNgoFromFirebase(); /* .then((value) {

    }); */

    return MaterialApp(
      navigatorKey: Utils.mainAppNav,
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Bundled',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
            //Menu(), //NgoDetails(ngoMock),//NgoHomeScreen(),
        '/landing_page': (context) => LandingPage(),
        '/donor_page': (context) => CreateDonorPage(),
      },
      //home: SplashPage(duration: 3, goToPage: LandingPage())
      //LandingPage()//LimitedBox(maxHeight: 200,child:Refresh(),)//DonorHomeScreen()//MyApp(),
    );
  }
}
