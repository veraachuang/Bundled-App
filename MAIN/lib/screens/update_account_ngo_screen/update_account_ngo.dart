import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/update_account_ngo_screen/widget/update_account_ngo_banner.dart';
import 'package:flutter_donation_app/screens/update_account_ngo_screen/widget/update_account_ngo_body.dart';

class UpdateNgoPage extends StatefulWidget {
  final Ngo ngo;
  UpdateNgoPage(this.ngo);

  @override
  _UpdateNgoPageState createState() => _UpdateNgoPageState(ngo);
}

class _UpdateNgoPageState extends State<UpdateNgoPage> {
  final Ngo ngo;
  _UpdateNgoPageState(this.ngo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UpdateNgoBanner(),
            //UpdateNgoBody(ngo: ngo),
          ],
        ),
      ),
    );
  }
}
