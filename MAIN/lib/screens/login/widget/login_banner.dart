import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';

class LoginBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.42,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 100 + kDefaultPadding,
                  right: kDefaultPadding,
                  //top: 10,
                ),
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.40))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 180 + kDefaultPadding,
                  left: kDefaultPadding + 20,
                  bottom: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding - 20,
                        bottom: kDefaultPadding - 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Nice to have you back! Login below to find your recent donations.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                  top: kDefaultPadding + 30,
                ),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () /* {
                              Get.back();
                            }, */
                            => Navigator.of(context).pop(false),/* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FirstPage(),
                                  ),
                                ), */
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            color: Colors.black,
                          ),
                        ),
                        
                      ],
                    ),
                    Row(
                      children: <Widget>[Image.asset("assets/images/dark-outline-appicon.png")],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
