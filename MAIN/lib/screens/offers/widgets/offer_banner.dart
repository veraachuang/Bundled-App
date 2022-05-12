import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';

class OfferBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 135,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.40))
                  ],
                  color: donationBox,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child:Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Center(
                          child: Text('OFFERS', 
                            style: TextStyle(
                              color: kFontDark, 
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ),
            ],
        ),
        /* Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Positioned(
              top: MediaQuery.of(context).padding.top + 15,
              left: 50,
              child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: kFontDark.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ),
          ),
        ), */
        /* Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Positioned(
              top: MediaQuery.of(context).padding.top + 15,
              left: 50,
              child: Container(
                height: 50,
                width: 50,
                //padding: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: kFontDark.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 25,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ),
          ),
        ), */
      ],
    ));
  }
}
