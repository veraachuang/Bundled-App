import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/home/donor_home.dart';
import 'package:flutter_donation_app/screens/login/widget/login_banner.dart';
import 'package:flutter_donation_app/screens/login/widget/login_input.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);
  
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LoginBanner(),
            LoginInput(),
            
            SizedBox(height: 15),
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //padding: const EdgeInsets.all(20.0),
                  child:
                    RichText(
                      
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        text: 'No account? ',
                        children: [ 
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: 'Sign Up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kButtonPrimary),
                          ),
                        ],
                      ),
                    ),
                  
                ),
              ],
            ),)
            
            //},
          ],
        ),
      ),
    );
  }
}
