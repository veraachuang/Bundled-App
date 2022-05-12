import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/screens/create_account_ngo_screen/widget/image_upload.dart';
import 'package:flutter_donation_app/screens/home/donor_home.dart';
import 'package:flutter_donation_app/screens/ngoHome/ngoHome.dart';
import 'package:flutter_donation_app/screens/ngo_register_confirm/ngo_register_confirm.dart';
import 'package:flutter_donation_app/service/http_service.dart';

import '../../../models/address.dart';
import '../../../service/database_service.dart';

class CreateNgoBody extends StatefulWidget {
  const CreateNgoBody({Key? key}) : super(key: key);

  @override
  _CreatengoBodyState createState() => _CreatengoBodyState();
}

class _CreatengoBodyState extends State<CreateNgoBody> {
  final Map<String, String> _formData = {};
  final HttpService httpService = HttpService();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController introController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
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
                            'Name',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }
                      },
                      onSaved: (value) => _formData['ngoName'] = value!,
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
                        hintText: 'Type your name',
                      ),
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
                            'Address',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Address';
                        }
                      },
                      onSaved: (value) => _formData['ngoAddress'] = value!,
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
                        hintText: 'Enter your address',
                      ),
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
                            'Contact',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: contactController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Contact number';
                        }
                      },
                      onSaved: (value) => _formData['ngoPhone'] = value!,
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
                        hintText: 'Enter your contact number',
                      ),
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
                            'Brief intro for NGO',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        onSaved: (value) =>
                            _formData['ngoDescription'] = value!,
                        textInputAction: TextInputAction.newline,
                        minLines: 6,
                        maxLines: 6,
                        maxLength: 260,
                        controller: introController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Summary';
                          }
                        },
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
                          hintText: 'Write a brief summary about ngo',
                        ),
                      ),
                    ]))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding - 20,
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
                            'Website',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: websiteController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Website';
                        }
                      },
                      onSaved: (value) => _formData['ngoSite'] = value!,
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
                        hintText: 'Enter website link',
                      ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter E-mail';
                        }
                      },
                      onSaved: (value) => _formData['ngoEmail'] = value!,
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
                        hintText: 'Enter NGO e-mail',
                      ),
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
                            'NGO Logo',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: ImageUpload(),
                      ),
                    ),
                    /* TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoPix'] = value!,
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
                        hintText: '',
                      ),
                    ), */
                  ],
                ),
              ),
              /* Container(
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
                            'Banco',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoBankName'] = value!,
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
                        hintText: 'Digite seu banco',
                      ),
                    ),
                  ],
                ),
              ), */
              /* Container(
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
                            'Agência',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoBankAgency'] = value!,
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
                        hintText: 'Digite sua agência',
                      ),
                    ),
                  ],
                ),
              ), */
              /* Container(
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
                            'Conta',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoBankAccount'] = value!,
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
                        hintText: 'Digite sua conta',
                      ),
                    ),
                  ],
                ),
              ), */
              !isLoading
                  ? Container(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding + 5,
                      ),
                      child: Column(
                        children: [
                          Container(
                              child: Container(
                            child: Stack(
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        DatabaseService service =
                                            DatabaseService();
                                        List<String> ngoDescription =
                                            introController.text.split(",");
                                        late List<Address> address;
                                        if (addressController.text
                                            .contains(",")) {
                                          List<String> fullAddress =
                                              addressController.text.split(",");
                                          address = Address(
                                              buildingName: fullAddress[0],
                                              streetName: fullAddress[1],
                                              cityName: fullAddress[2]) as List<Address>;
                                        }
                                        Ngo ngo = Ngo(
                                            ngoAddress: address,
                                            ngoDescription: ngoDescription,
                                            ngoEmail: emailController.text,
                                            ngoName: nameController.text,
                                            ngoSite: websiteController.text,
                                            ngoPhone: contactController.text,
                                            ngoImg: '',
                                            ngoPix: '');
                                        setState(() {
                                          isLoading = true;
                                        });
                                        service.getNgo();
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NgoHomeScreen()));
                                      } 
                                      

                                      /* _formKey.currentState!.save();

                                      var ngo = new Ngo(
                                        ngoName: _formData['ngoName'] ?? '',
                                        ngoAddress:
                                            _formData['ngoAddress'] ?? '',
                                        ngoPhone: _formData['ngoPhone'] ?? '',
                                        ngoDescription:
                                            _formData['ngoDescription'] ?? '',
                                        ngoSite: _formData['ngoSite'] ?? '',
                                        ngoEmail: _formData['ngoEmail'] ?? '',
                                        ngoPix: _formData['ngoPix'] ?? '',
                                        /*ngoBankName: _formData['ngoBankName'] ?? '',
                                  ngoBankAgency:
                                      _formData['ngoBankAgency'] ?? '',
                                  ngoBankAccount:
                                      _formData['ngoBankAccount'] ?? '', */
                                        ngoImg: "assets/images/amigos.png",
                                      );

                                      final response = httpService.saveNgo(ngo); */

                                      /* response.then((value) =>
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NgoRegisterConfirmPage(
                                                          value)))); */
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.bottomLeft,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.green
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ));
  }
}
