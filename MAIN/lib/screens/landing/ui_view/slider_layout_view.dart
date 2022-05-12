// ignore_for_file: deprecated_member_use
//fix button for home page

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/pages.dart';
import 'package:flutter_donation_app/screens/first_screen/first_screen.dart';
import 'package:flutter_donation_app/widgets/get_started_button.dart';

import '../../../constants/constants.dart';
import '../../../constants/constants.dart';
import '../../../widgets/slide_dots.dart';
import '../../../widgets/slide_items/slide_item.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  bool inFinalPage() {
    if (_currentPage == sliderArrayList.length - 1) {
      return true;
    }
    return false;
  }

  Widget topSliderLayout() => Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: sliderArrayList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: inFinalPage()
                      ? Container()
                      : Padding(
                        padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                        child: TextButton(
                          style: TextButton.styleFrom(padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),),
                          child: Text(NEXT,
                              style: TextStyle(
                                  fontFamily: OPEN_SANS,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeIn);
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: inFinalPage()
                      ? Container()
                      : Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                        child: TextButton(
                          style: TextButton.styleFrom(padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstPage()));
                          },
                          child: Text(
                            SKIP,
                            style: TextStyle(
                                fontFamily: OPEN_SANS,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: inFinalPage()
                      ? GetStartedButton()
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      );
}
