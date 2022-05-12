import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/service/database_service.dart';
import 'package:flutter_donation_app/utils.dart';
import 'package:provider/provider.dart';

import 'Widget/donate_banner.dart';
import 'Widget/donate_informations.dart';

class DonateDetails extends StatefulWidget {
  final Ngo ngo;
  DonateDetails(this.ngo);

  @override
  _DonateDetailsState createState() => _DonateDetailsState();
}

class _DonateDetailsState extends State<DonateDetails> {
  @override
  Widget build(BuildContext context) {
    /*  DatabaseService donate =
        Provider.of<DatabaseService>(context, listen: false); */
    List<Ngo> ngolist = Utils.getMockedNGOs();
    /* List<Ngo> firengo = donate.getSearch() as List<Ngo>; */

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DonateBanner(
              widget.ngo,
            ),
            DonateInformations(
              widget.ngo,
            ),
          ],
        ),
      ),
    );
  }
}
