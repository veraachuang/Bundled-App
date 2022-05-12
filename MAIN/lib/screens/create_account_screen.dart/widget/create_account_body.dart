import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/create_account_ngo_screen/create_account_ngo.dart';
import 'package:flutter_donation_app/screens/home/donor_home.dart';
import 'package:flutter_donation_app/screens/ngo_register_confirm/ngo_register_confirm.dart';
import 'package:flutter_donation_app/service/http_service.dart';

import '../../../main.dart';
import '../../../utils.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({Key? key}) : super(key: key);

  @override
  _CreateAccountBodyState createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  String password = '';
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final HttpService httpService = HttpService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future signUp() async {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator()));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message);
      }
      //Navigator.of(context) not working!
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateNGOPage()));
    }

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.black;
    }

    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: kDefaultPadding - 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'E-mail',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      onSaved: (value) => _formData['ngoEmail'] = value!,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 23.0, bottom: 16.0, top: 15.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter your e-mail',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: kDefaultPadding - 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 23.0, bottom: 16.0, top: 15.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter a password',
                        suffixIcon: GestureDetector(
                          child: Icon(
                              _showPassword1 == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey),
                          onTap: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                        ),
                      ),
                      obscureText: _showPassword1 == false ? true : false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min. 6 characters'
                          : null,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: kDefaultPadding - 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Confirm your password',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      controller: confirmpasswordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 23.0, bottom: 16.0, top: 15.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter your password again',
                        suffixIcon: GestureDetector(
                          child: Icon(
                              _showPassword2 == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey),
                          onTap: () {
                            setState(() {
                              _showPassword2 = !_showPassword2;
                            });
                          },
                        ),
                      ),
                      obscureText: _showPassword2 == false ? true : false,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Container(
                        child: Container(
                      child: Stack(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: signUp,
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.bottomLeft,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [kFormButtonPrimary, kFormButtonSecundary]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 335,
                                  height: 56,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Create an account',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
