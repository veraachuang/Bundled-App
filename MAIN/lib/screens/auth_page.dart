import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/login/login.dart';

import 'create_account_screen.dart/create_account_screen.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginPage(onClickedSignUp: toggle) : CreateAccountPage(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
