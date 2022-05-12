import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/auth_page.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.32,
          child: Stack(
            children: <Widget>[
              

              Container(
                padding: EdgeInsets.only(
                  left: 100 + kDefaultPadding,
                  right: kDefaultPadding,
                  //top: 10,
                ),
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/images/top2.png")),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 200 + kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                  top: 10 + kDefaultPadding,
                ),
                child: Align(alignment: Alignment.topRight,
                child: 
                IconButton(
                            onPressed:() => {FirebaseAuth.instance.signOut(),
                              Navigator.pushAndRemoveUntil(
                                context, 
                                MaterialPageRoute(builder: (context) => AuthPage()),
                                (Route<dynamic>route) => false,)}, 
                            icon: new Icon(logout),
                            color: Colors.white,),/* ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    //minimumSize: Size.fromHeight(10),

                  ),
                  icon: Icon(Icons.logout,size: 10), 
                  label: Text(
                    '', 
                    style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut()
                  ), */),
              ),
              
              Container(
                padding: EdgeInsets.only(
                  left: 100 + kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                  top: 50 + kDefaultPadding,
                ),
                child: Column(
                  children: <Widget>[
                    //SizedBox(height: 40,),
                    Row(
                      children: <Widget>[
                        Text(
                          'Easy donations',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        'Connecting who can donate to those in need',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding - 13,
                  top: kDefaultPadding + 35,
                ),
                child: Row(
                  children: <Widget>[Image.asset("assets/images/dark-outline-appicon.png")],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryLight.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          //controller: ,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: kFontLight,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
