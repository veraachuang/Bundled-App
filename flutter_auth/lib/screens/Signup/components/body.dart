// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/screens/Signup/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../components/already_have_an_account_check.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../services/auth_service.dart';
import '../../Login/login_screen.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class Body extends StatelessWidget {
final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: "Your Email", 
              onChanged: (value) {},
              controller: emailController,),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: passwordController,),
            RoundedButton(
                text: "SIGN UP",
                press: () async {
                  context.read<AuthService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
                }),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                }),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg", 
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg", 
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg", 
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
