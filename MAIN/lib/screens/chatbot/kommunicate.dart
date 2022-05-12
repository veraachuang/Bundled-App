import 'package:flutter/material.dart';
import 'package:flutter_donation_app/constants/constants.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Chatbot extends StatelessWidget {
  void buildConversation() {
    dynamic conversationObject = {'appId': '381785d63f86411aab69724acc33391bc'};

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((result) {
      print("Conversation builder success : " + result.toString());
    }).catchError((error) {
      print("Conversation builder error occurred : " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                color: kFormButtonSecundary,
                child: new MaterialButton(
                  onPressed: () async {
                    buildConversation();
                  },
                  minWidth: 150,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Text("Chat with us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0)
                          .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                )),
          ],
        ),
      ),
    );
  }
}
