// ignore_for_file: prefer_const_constructors, duplicate_ignore, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:provider/provider.dart';
// import 'package:flutterfire_ui/auth.dart';
import 'wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create:(_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
          
        ),
        Provider<AuthService>.value(value: AuthService(FirebaseAuth.instance)), 
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Authentication',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: AuthGate(),
        ),
    );
  }
}