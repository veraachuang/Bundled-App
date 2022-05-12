import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:flutter_donation_app/screens/ngoHome/widgets/new_item.dart';
import 'package:flutter_donation_app/screens/ngoHome/widgets/new_item_banner.dart';


class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => 
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NewItemBanner(),
                      NewItem(),
                    ],
                  )),
              )));
          },
          splashColor: kFormButtonPrimary,
          backgroundColor: kFormButtonSecundary,
          label: Text('Add your request'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
