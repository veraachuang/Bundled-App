import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/first_screen/first_screen.dart';


class CreateDonorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 100 + kDefaultPadding,
                  right: kDefaultPadding,
                  //top: 10,
                ),
                height: size.height * 0.4,
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
                  top: 110 + kDefaultPadding,
                  left: kDefaultPadding + 20,
                  bottom: kDefaultPadding,
                  right: kDefaultPadding +20,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding - 20,
                        //bottom: kDefaultPadding +20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Donor',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 35),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'We are happy with your interest in contributing to those who need it, fill in the fields below with your data.',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230,
                padding: EdgeInsets.only(
                  left: kDefaultPadding + 10,
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
                      children: <Widget>[
                        SizedBox(
                          height:100,
                          width: 100,
                          child: Image.asset("assets/images/dark-outline-appicon.png")
                        ),
                        ]
                    )
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
