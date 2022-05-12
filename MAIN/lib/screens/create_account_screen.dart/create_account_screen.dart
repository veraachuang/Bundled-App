import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/create_account_screen.dart/widget/create_account_banner.dart';
import 'package:flutter_donation_app/screens/create_account_screen.dart/widget/create_account_body.dart';

class CreateAccountPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const CreateAccountPage({Key? key, required this.onClickedSignIn}) : super(key: key);
  
  @override
  _CreateAccountPage createState() => _CreateAccountPage();
}

class _CreateAccountPage extends State<CreateAccountPage>{
  late final VoidCallback onClickedSignIn;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CreateAccountBanner(),
            CreateAccountBody(),

            SizedBox(height: 10),
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
                        text: 'Already have an account? ',
                        children: [ 
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: 'Sign In',
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
          ],
        ),
      ),
    );
  }
}
