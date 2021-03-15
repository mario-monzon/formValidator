import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_validation/models/member_model.dart';
import 'package:flutter_form_validation/models/news_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference newsCollection =
      FirebaseFirestore.instance.collection('news');

  Future<void> updateUserData(String title, String body, String date) async {
    return await newsCollection
        .doc(uid)
        .set({'title': title, 'body': body, 'date': date});
  }

  // news list from snapshot
  List<News> _newsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return News(
          title: doc.data()['title'] ?? '',
          body: doc.data()['body'] ?? '',
          date: doc.data()['date'] ?? '');
    }).toList();
  }

  // user data from snapshots
  MemberData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MemberData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  // get brews stream
  Stream<List<News>> get brews {
    return newsCollection.snapshots().map(_newsListFromSnapshot);
  }

  // get user doc stream
  Stream<MemberData> get userData {
    return newsCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
