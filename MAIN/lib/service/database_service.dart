import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_donation_app/models/ngo.dart';
import 'package:flutter_donation_app/models/request.dart';

class DatabaseService {
  FirebaseFirestore? _instance;

  final CollectionReference ngoCollection = FirebaseFirestore.instance.collection(
      'NGOLIST'); /* .withConverter(
        fromFirestore: Ngo.fromFirestore, 
        toFirestore: (Ngo ngo, _) => ngo.toFirestore()); */

  final CollectionReference requestCollection =
      FirebaseFirestore.instance.collection('REQUEST');

  final CollectionReference donationCollection =
      FirebaseFirestore.instance.collection('Donation');

  void getdataonce() async {
    final ref = _instance
        ?.collection('NGOLIST')
        .doc("9p0B68mcZzDHNzJPgdBX")
        .withConverter(
            fromFirestore: Ngo.fromFirestore,
            toFirestore: (Ngo ngo, _) => ngo.toFirestore());
    final docSnap = await ref?.get();
    final ngo = docSnap!.data();
    if (ngo != null) {
      print(ngo);
    } else {
      print("No such document");
    }
  }

  void getData() {
    // [START get_data_once_get_all_documents_in_a_collection]
    ngoCollection.get().then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
    // [END get_data_once_get_all_documents_in_a_collection]
  }

  Stream<QuerySnapshot> getStream() {
    return ngoCollection.snapshots();
  }

  Stream<List<Ngo>> getSearch() {
    final stream = _instance!.collection('NGOLIST').snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return Ngo.fromJson(doc.data());
        }).toList());
  }

  Future<DocumentReference> addNgo(Ngo ngo) {
    return ngoCollection.add(ngo.toJson());
  }

  Future<DocumentReference> makeRequest(Request request) {
    return requestCollection.add(request.toJson());
  }

  Future<DocumentReference> makeDonation(Request request) {
    return requestCollection.add(request.toJson());
  }

  void updateNgo(Ngo ngo) async {
    await ngoCollection.doc(ngo.id).update(ngo.toJson());
  }

  List<Ngo> ngo = [];

  List<Ngo> getNgo() {
    return ngo;
  }

  Future<void> getNgoFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('NGOLIST');

    DocumentSnapshot snapshot = categories.snapshots() as DocumentSnapshot<Object?>;
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      data.forEach((key, value) {
        Ngo ngodata = Ngo.fromJson(value);
        ngo.add(ngodata);
      });
      /* var ngoData = data['categories'] as List<dynamic>;
      ngoData.forEach((catData) {
        Ngo cat = Ngo.fromMap(catData);
        _ngo.add(cat);
      }); */
    }

    //return _ngo;
  }

/*   Stream<List<Ngo>> retrieveData<Ngo>({
    required String path,
    required Ngo builder(Map<String, dynamic> data),
  }) {
    final reference = _instance!.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data())).toList());
  } */

  /* Future<QuerySnapshot> fetchNgos() async {
    return await _instance!.collection('NGOs').get();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> readItems() {
    DocumentReference<Map<String, dynamic>> ngos =
        FirebaseFirestore.instance.collection('NGOs').doc('ngoList');

    return ngos.snapshots();
  } */
}
