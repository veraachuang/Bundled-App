import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/auth_page.dart';
import 'package:flutter_donation_app/screens/create_account_screen.dart/create_account_screen.dart';
import 'package:flutter_donation_app/screens/home/donor_home.dart';
import 'package:flutter_donation_app/screens/landing/landing_page.dart';
import 'package:flutter_donation_app/screens/login/login.dart';

import '../../../constants/constants.dart';
import '../../create_account_donor_screen.dart/create_donor_screen.dart';

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: bColor,
            image: DecorationImage(
                image: AssetImage("assets/images/background2.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Flexible(
                      child: Center(
                        child: Text('Bundled',
                            style: TextStyle(
                              fontSize: 52.0,
                              color: bColor,//Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ))
                ],
              )),
        ),
        Container(
            padding: EdgeInsets.only(
                top: kDefaultPadding + 10, left: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
            )),
        Container(
          padding: EdgeInsets.only(
              top: kDefaultPadding + 10,
              right: kDefaultPadding,
              left: kDefaultPadding),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                          },
                          icon: new Icon(Icons.info_outline_rounded),
                          color: bColor,//Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                primary: bColor,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthPage()));

                              /* Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StreamBuilder<User?>(
                                      stream: FirebaseAuth.instance
                                          .authStateChanges(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  'Something went wrong!'));
                                        } else if (snapshot.hasData) {
                                          return DonorHomeScreen();
                                        } else {
                                          return /* LoginPage(
                                              onClickedSignUp: () => () {}); */ 
                                              AuthPage();
                                        }
                                       
                                      }))); */
                            },
                            child: const Text('Login')

                            //mainAxisAlignment: MainAxisAlignment.end,

                            ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            height: 800,
            padding: EdgeInsets.only(
              top: kDefaultPadding + 450,
            ),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(
                  bottom: kDefaultPadding + 5,
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kFormButtonSecundary,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateDonorPage()));
                    },
                    child: Text(
                      'Start donating',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      //Get.to(AuthPage());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AuthPage()/* CreateAccountPage(
                                onClickedSignIn: () => () {},
                              ) */));
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding - 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register as NGO',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        ))),
              ),
            ]))
      ],
    ));
  }
}
