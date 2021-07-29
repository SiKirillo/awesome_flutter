import 'package:brew_coffee/models/brew.dart';
import 'package:brew_coffee/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class DatabaseService {
  final firestore.CollectionReference _brewCollection =
      firestore.FirebaseFirestore.instance.collection('brews');
  late String _userUid;

  Future updateUserData(
      String uid, String name, int sugars, int strength) async {
    final firestore.WriteBatch _batch =
        firestore.FirebaseFirestore.instance.batch();
    firestore.QuerySnapshot brewSnapshot =
        await _brewCollection.where('uid', isEqualTo: uid).get();

    if (brewSnapshot.size != 0) {
      _batch.update(brewSnapshot.docs[0].reference, {
        'name': name,
        'sugars': sugars,
        'strength': strength,
      });
    } else {
      _batch.set(_brewCollection.doc(), {
        'uid': uid,
        'name': name,
        'sugars': sugars,
        'strength': strength,
      });
    }

    await _batch.commit();
  }

  void updateUserUid(String uid) {
    _userUid = uid;
  }

  List<Brew> _brewListFromSnapshot(firestore.QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Brew(
              uid: doc.get('uid') ?? 'Unknown',
              name: doc.get('name') ?? 'Unknown',
              sugars: doc.get('sugars') ?? 0,
              strength: doc.get('strength') ?? 100,
            ))
        .toList();
  }

  UserData _userDataFromSnapshot(firestore.QuerySnapshot snapshot) {
    return UserData(
      uid: snapshot.docs[0].get('uid'),
      name: snapshot.docs[0].get('name'),
      sugars: snapshot.docs[0].get('sugars'),
      strength: snapshot.docs[0].get('strength'),
    );
  }

  Stream<List<Brew>> get brews {
    return _brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return _brewCollection
        .where('uid', isEqualTo: _userUid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
