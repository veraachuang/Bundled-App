// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/model/user_model.dart';
import 'package:flutter_auth/screens/Login/login_screen.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/already_have_an_account_check.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import 'package:provider/provider.dart';

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
              controller: emailController,
            ),
            //SizedBox(height: size.height * 0.001),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: passwordController,
            ),
            //SizedBox(height: size.height * 0.001),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  context.read<AuthService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
                }),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
                login: true,
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
