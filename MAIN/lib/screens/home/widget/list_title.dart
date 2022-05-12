import 'package:flutter/cupertino.dart';
import 'package:flutter_donation_app/constants/constants.dart';

class ListTitle extends StatelessWidget {
  final String leftText;
  ListTitle(this.leftText);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        padding: EdgeInsets.only(/* top: kDefaultPadding, */ left: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leftText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: kFont),
            ),
            Container(
              padding: EdgeInsets.only(top: kDefaultPadding - 10, bottom: kDefaultPadding-5),
              child: Text(
                'Choose an NGO below to make a donation.',
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 16, color: kFont),
              ),
            ),
          ],
        ));
  }
}
