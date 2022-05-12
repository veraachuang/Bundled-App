/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/service/http_service.dart';

class UpdateNgoBody extends StatefulWidget {
  final Ngo ngo;
  const UpdateNgoBody({Key? key, required this.ngo}) : super(key: key);

  @override
  _UpdateNgoBodyState createState() => _UpdateNgoBodyState(ngo);
}

class _UpdateNgoBodyState extends State<UpdateNgoBody> {
  final Ngo ngo;
  _UpdateNgoBodyState(this.ngo);

  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
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
                            'Nome',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoName'] = value!,
                      initialValue: ngo.ngoName,
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
                        hintText: 'Digite seu Nome',
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
                            'Endereço',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoAddress'] = value!,
                      initialValue: ngo.ngoAddress,
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
                        hintText: 'Digite seu endereço',
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
                            'Contato',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoPhone'] = value!,
                      initialValue: ngo.ngoPhone,
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
                        hintText: 'Digite seu contato',
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
                            'Fale sobre a NGO',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoDescription'] = value!,
                      initialValue: ngo.ngoDescription,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 6,
                      maxLength: 260,
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
                        hintText: 'Escreva um breve resumo sobre a NGO',
                      ),
                    ),
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
                            'Site',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoSite'] = value!,
                      initialValue: ngo.ngoSite,
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
                        hintText: 'Digite o site',
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
                            'PIX',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: null,
                      onSaved: (value) => _formData['ngoPix'] = value!,
                      initialValue: ngo.ngoPix,
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
                        hintText: 'Digite seu PIX',
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
                      controller: null,
                      onSaved: (value) => _formData['ngoEmail'] = value!,
                      initialValue: ngo.ngoEmail,
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
                        hintText: 'Digite seu e-mail',
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
                      initialValue: 'NGO BANK NAME',
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
                      initialValue: 'NGO BANK AGENCY',
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
                      initialValue: 'NGO BANK ACCOUNT',
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
              ),
              Container(
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
                              onPressed: () {
                                _formKey.currentState!.save();

                                var newNgo = new Ngo(
                                  ngoName: _formData['ngoName'] ?? '',
                                  ngoAddress: _formData['ngoAddress'] ?? '',
                                  ngoPhone: _formData['ngoPhone'] ?? '',
                                  ngoDescription:
                                      _formData['ngoDescription'] ?? '',
                                  ngoSite: _formData['ngoSite'] ?? '',
                                  ngoPix: _formData['ngoPix'] ?? '',
                                  /* ngoBankName: _formData['ngoBankName'] ?? '',
                                  ngoBankAgency:
                                      _formData['ngoBankAgency'] ?? '',
                                  ngoBankAccount:
                                      _formData['ngoBankAccount'] ?? '', */
                                  ngoEmail: _formData['ngoEmail'] ?? '',
                                  ngoImg: "assets/images/amigos.png",
                                );

                                final response =
                                    httpService.updateNgo(newNgo, ngo.id ?? '');

                                response.then(
                                    (value) => Navigator.of(context).pop());
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.bottomLeft,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.green]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 335,
                                  height: 56,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Salvar Modificações',
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
 */