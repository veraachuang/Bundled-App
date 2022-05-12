//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/constants/constants.dart';
import 'package:onboarding/ui_view/slider_layout_view.dart';
//import 'package:onboarding/widgets/custom_font.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bColor,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
