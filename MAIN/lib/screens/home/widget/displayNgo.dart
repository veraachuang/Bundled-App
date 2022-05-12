import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

class DisplayNgo extends StatefulWidget {
  DocumentSnapshot<Map<String,dynamic>> snapshot;

  DisplayNgo(this.snapshot);

  @override
  _DisplayNgo createState() => new _DisplayNgo();
}

class _DisplayNgo extends State<DisplayNgo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 200,
            margin: EdgeInsets.all(10),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network('assets/images/splash.png',
                height: 100,
                fit: BoxFit.cover),
            ),
          ),

          new Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Text('ngoName'),//widget.snapshot.data['ngoName'][0]),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple,
                      ),
                      new SizedBox(width: 8.0),

                      new Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        child: new Text('ngoName',//widget.snapshot.data['ngoName'],
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black)
                          ),
                      )
                    ],
                  ),
                ),

                new SizedBox(height: 10.0,),

                new Text('ngoAddress',//widget.snapshot.data['ngoAddress'],
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white)
                )],
            ),
          )
        ],
      ),
    );
  }
}
