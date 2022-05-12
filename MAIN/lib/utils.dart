import 'package:flutter/material.dart';
import 'package:flutter_donation_app/models/address.dart';
import 'package:flutter_donation_app/models/donate.dart';
import 'package:flutter_donation_app/models/ngo.dart';

class Utils {
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static List<Ngo> getMockedNGOs() {
    return [
      Ngo(
        ngoName: 'Salvation Army',
        ngoAddress: getAddress(),
        ngoDescription: ['We', 'are', 'Salvation', 'Army'],
        ngoEmail: 'sspfsnt.yfc@hkm.salvationarmy.org',
        ngoImg: 'assets/images/SA.png',
        ngoPhone: '(852) 2390 9361',
        ngoPix: 'assets/images/SAB.png',
        ngoSite: 'https://salvationarmy.org.hk',
      ),
      Ngo(
        ngoName: 'Salvation Army',
        ngoAddress: getAddress(),
        ngoDescription: ['We', 'are', 'Salvation', 'Army'],
        ngoEmail: 'sspfsnt.yfc@hkm.salvationarmy.org',
        ngoImg: 'assets/images/SA.png',
        ngoPhone: '(852) 2390 9361',
        ngoPix: 'assets/images/SAB.png',
        ngoSite: 'https://salvationarmy.org.hk',
      ),
      Ngo(
        ngoName: 'Salvation Army',
        ngoAddress: getAddress(),
        ngoDescription: ['We', 'are', 'Salvation', 'Army'],
        ngoEmail: 'sspfsnt.yfc@hkm.salvationarmy.org',
        ngoImg: 'assets/images/SA.png',
        ngoPhone: '(852) 2390 9361',
        ngoPix: 'assets/images/SAB.png',
        ngoSite: 'https://salvationarmy.org.hk',
      ),
    ];
  }

  static List<Address> getAddress() {
    return [
      Address(
          buildingName: 'Fuk Sing House 二樓69室,',
          streetName: 'Fuk Wing St 63-69號,',
          cityName: 'Sham Shui Po'),
    ];
  }

  static List<Donate> getDonation() {
    return [
      Donate(
          itemName: 'Chinese textbook',
          condition: ['NEW', '', ''],
          ngoName: 'Salvation Army',
          ngoImg: 'assets/images/SA.png',
          category: 'EDU'),
      Donate(
          itemName: 'English textbook',
          condition: ['NEW', 'SLIGHTLY USED', ''],
          ngoName: 'SoCO',
          ngoImg: 'assets/images/soco.jpeg',
          category: 'EDU'),
      Donate(
          itemName: 'Stationery - Color Pencils',
          condition: ['NEW', 'SLIGHTLY USED', 'HEAVILY USED'],
          ngoName: 'Hope of the City',
          ngoImg: 'assets/images/hotcB.jpeg',
          category: 'EDU'),
      Donate(
          itemName: 'Stationery - Correction Tape',
          condition: ['', 'SLIGHTLY USED', 'HEAVILY USED'],
          ngoName: 'Salvation Army',
          ngoImg: 'assets/images/SA.png',
          category: 'EDU'),
      Donate(
          itemName: 'Notebooks',
          condition: ['NEW', '', ' '],
          ngoName: 'Salvation Army',
          ngoImg: 'assets/images/SA.png',
          category: 'EDU'),
    ];
  }

  static List<Donate> getConditions() {
    return [
      Donate(itemName: '', 
      condition: ['NEW', 'SLIGHTLY USED', 'HEAVILY USED'], 
      ngoName: '', 
      ngoImg: '', 
      category: '')
    ];
  }
}
