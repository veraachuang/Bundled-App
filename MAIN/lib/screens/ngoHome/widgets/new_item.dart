import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/models/request.dart';
import 'package:flutter_donation_app/models/tag.dart';
import 'package:flutter_donation_app/utils.dart';

import '../../../models/condition.dart';
import '../../../models/donate.dart';
import '../../../service/database_service.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final Map<String, String> _formData = {};
  TextEditingController itemnameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  //TextEditingController conditionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Map<String, bool> values = {
    'NEW': false,
    'SLIGHTLY USED': false,
    'HEAVILY USED': false,
  };

  List<Donate> donate = Utils.getConditions();

  bool NewVal = false;
  bool SlightlyVal = false;
  bool HeavilyVal = false;

  late Request request;

  List<Condition> selectedcondition = [];

  String dropdownvalue = 'Education';
  var items = [
    'Education',
    'Recreation',
    'Electronics',
    'Daily Necessities',
    'Clothes'
  ];

  void getSelectedItem() {
    setState(() {
      holder = dropdownvalue;
      print(dropdownvalue);
    });
  }

  String holder = '';
  String selectedItem = '';

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
                            'Item Name',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: itemnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Item Name';
                        }
                      },
                      onSaved: (value) => _formData['itemName'] = value!,
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
                        hintText: 'Enter item name',
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
                            'Quantity',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the quantity requested';
                        }
                        final n = num.tryParse(value);
                        if (n == null) {
                          return '"$value" is not a valid number';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['quantity'] = value!,
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
                        hintText: 'Enter the amount needed',
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
                    Row(
                      children: [
                        Text(
                          'Condition',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    /* ListView(
                      children: values.keys.map((String key) {
                        return new CheckboxListTile(
                          title: new Text(key),
                          value: values[key],
                          onChanged: (value) {
                            setState(() {
                              values[key] = value!;
                              selectedcondition.clear();
                              values.forEach((key, value) {
                                selectedcondition.add(Condition(key, value));
                              });
                            });
                            print(key);
                          },
                        );
                      }).toList(),
                    ), */
                    Row(
                      children: [
                        Checkbox(
                          value: this.NewVal,
                          onChanged: (value) {
                            setState(() {
                              this.NewVal = value!;
                            });
                            if (value == true)
                              selectedcondition.add(Condition(title: 'NEW'));
                          },
                        ),
                        Tag(
                          donate: donate[0],
                          color: tagYellow,
                          no: 0,
                        ),
                        Checkbox(
                          value: this.SlightlyVal,
                          onChanged: (value) {
                            setState(() {
                              this.SlightlyVal = value!;
                            });
                            if (value == true)
                              selectedcondition
                                  .add(Condition(title: 'SLIGHTLY USED'));
                          },
                        ),
                        Tag(
                          donate: donate[0],
                          color: tagGreen,
                          no: 1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this.HeavilyVal,
                          onChanged: (value) {
                            setState(() {
                              this.HeavilyVal = value!;
                            });
                            if (value == true)
                              selectedcondition
                                  .add(Condition(title: 'HEAVILY USED'));
                          },
                        ),
                        Tag(
                          donate: donate[0],
                          color: tagBlue,
                          no: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: DropdownButton(
                            borderRadius: BorderRadius.circular(15),
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                dropdownvalue = selectedItem;
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
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
                                      getSelectedItem();
                                      if (_formKey.currentState!.validate()) {
                                        DatabaseService service =
                                            DatabaseService();
                                        request = Request(
                                            itemName: itemnameController.text,
                                            quantity: int.parse(
                                                quantityController.text),
                                            condition: selectedcondition,
                                            category: holder);
                                        setState(() {
                                          isLoading = true;
                                        });
                                        service.makeRequest(request);
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                      Navigator.of(context).pop(false);
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
                                            kFormButtonPrimary,
                                            kFormButtonSecundary
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        width: 335,
                                        height: 56,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Make a request',
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
