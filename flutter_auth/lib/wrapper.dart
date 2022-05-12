import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Home/home_screen.dart';
import 'package:flutter_auth/screens/Login/login_screen.dart';
// import 'package:flutterfire_ui/auth.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //User not signed in
          return LoginScreen();
        }

        return HomeScreen();
      },
    );
  }
}
