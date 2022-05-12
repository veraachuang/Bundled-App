import 'package:flutter/cupertino.dart';
import 'package:flutter_donation_app/screens/first_screen/first_screen.dart';

import '../constants/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: 'assets/images/slider_1.png',
        sliderHeading: SLIDER_HEADING_1,
        sliderSubHeading: SLIDER_DESC1),
    Slider(
        sliderImageUrl: 'assets/images/slider_2.png',
        sliderHeading: SLIDER_HEADING_2,
        sliderSubHeading: SLIDER_DESC2),
    Slider(
        sliderImageUrl: 'assets/icons/alden-white.png',
        sliderHeading: SLIDER_HEADING_3,
        sliderSubHeading: SLIDER_DESC3),
    //FirstPage()
  ];
