

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/create_account_donor_screen.dart/widget/create_donor_banner.dart';
import 'package:flutter_donation_app/screens/create_account_donor_screen.dart/widget/create_donor_body.dart';

class CreateDonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CreateDonorBanner(),
            CreateDonorBody(),
          ],
        ),
      ),
    );
  }
}
