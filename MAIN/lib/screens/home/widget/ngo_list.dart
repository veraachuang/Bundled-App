import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/details/ngo_details.dart';
import 'package:flutter_donation_app/utils.dart';
import 'package:provider/provider.dart';

import '../../../models/ngo.dart';
import '../../../service/database_service.dart';
import 'ngo_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NgoList extends StatefulWidget {
  @override
  _NgoList createState() => _NgoList();
}

class _NgoList extends State<NgoList> {
  Function? onCardClick;
  Ngo? ngo;

  List<Ngo> ngolist = [];
  //service.getNgoFromFirebase(); //Utils.getMockedNGOs();

  @override
  Widget build(BuildContext context) {
    final DatabaseService service = DatabaseService();

    DatabaseService databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    databaseService.getNgoFromFirebase();
    ngolist = databaseService.getNgo();
    int index = ngolist.length;

    return StreamBuilder<QuerySnapshot>(
        stream: service.getStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            /* for (int i = 0; i < snapshot.data!.docs.length; i++) {
              DocumentSnapshot snap = snapshot.data!.docs[i];
              Map<String, dynamic> data = categories.doc('NGOLIST').get().data() as Map<String, dynamic>;
              ngolist.add(Ngo.fromJson(data));
            } */
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView(
                children: documents
                    .map((doc) => Card(
                          child: ListTile(
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -3),
                            title: Text(doc['ngoName']),
                            subtitle: Text(doc['ngoSite']),
                            /* trailing: Text(doc['ngoEmail']) */
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      NgoDetails(ngolist[0])));
                            },
                          ),
                        ))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          return Center(child: CircularProgressIndicator());
        });

    //ideally
    /* StreamBuilder<QuerySnapshot>(
        stream: service.getStream(),
        builder: (context, snapshot)
        /* stream: service.getSearch(),
        builder: (context, snapshot) */ {
          if (snapshot.hasData) {
            return _buildList(context, snapshot.data?.docs ?? []);
          } else if (snapshot.hasError) {
            const Text('No data available right now');
          }
          return Center(child: CircularProgressIndicator());
        }); */

    /* Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('$number',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: retrievedNgoList.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return NgoCard(
                    ngos: retrievedNgoList[index],
                    onCardClick: () {},
                  );
                }))
      ],
    ); */

    /* floatingActionButton: FloatingActionButton(
    onPressed: (() {
        Navigator.pushNamed(context, '/add');
    }),
    tooltip: 'add',
    child: const Icon(Icons.add),
    ), */
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20.0),
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final ngo = Ngo.fromSnapshot(snapshot);

    return NgoCard(
      ngos: ngo,
    );
  }
}

/* void listen(){
  db.collection('NGOLIST').snapshots().listen((event) {
      final ngo = [];
      for (var doc in event.docs) {
        ngo.add(doc.data()['ngoName']);
      }
      print('NGOs in HK: ${ngo}');
    });
} */