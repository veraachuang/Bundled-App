import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/details/widget/ngo_banner.dart';
import 'package:flutter_donation_app/screens/details/widget/ngo_description.dart';

class NgoDetails extends StatefulWidget {
  final Ngo ngo;
  NgoDetails(this.ngo);

  @override
  _NgoDetailsState createState() => _NgoDetailsState();
}

class _NgoDetailsState extends State<NgoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            NgoBanner(
              widget.ngo,
            ),
            NgoDescription(
              widget.ngo,
            ),
          ],
        ),
      ),
    );
  }
}
