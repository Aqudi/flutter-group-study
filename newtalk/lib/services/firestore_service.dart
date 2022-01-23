import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:newtalk/models/app_user.dart';
export 'package:logger/logger.dart';
import 'package:newtalk/top_level_providers.dart';

final fireStoreServiceProvider =
    Provider<FireStoreService>((ref) => FireStoreService(
          ref.read(firebaseStoreProvider),
          ref.read(loggerProvider),
        ));

class FireStoreService {
  final FirebaseFirestore _firestore;
  final Logger _logger;

  CollectionReference<AppUser> get _usersCollectionReference =>
      _firestore.collection("users").withConverter(
            fromFirestore: (snapshot, _) => AppUser.fromFirestore(snapshot),
            toFirestore: (AppUser user, _) => user.toJson(),
          );

  FireStoreService(this._firestore, this._logger);

  Future<void> createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.uid).set(
            AppUser(
              uid: user.uid,
              displayName: user.displayName,
              email: user.email,
              photoURL: user.photoURL,
            ),
            SetOptions(merge: true),
          );
    } catch (e, _) {
      _logger.e(e);
    }
  }

  Future<AppUser?> getUser(String uid) async {
    try {
      final user = await _usersCollectionReference.doc(uid).get();
      return user.data();
    } catch (e, _) {
      _logger.e(e);
    }
  }

  Future<void> deleteUser(String? uid) async {
    try {
      await _usersCollectionReference.doc(uid).delete();
      _logger.d('deleteUser: $uid');
    } catch (e, _) {
      _logger.e(e);
    }
  }

  Future<List<AppUser>?> getFriends(AppUser user) async {
    try {
      final userData = await _usersCollectionReference
          .where("uid", isNotEqualTo: user.uid)
          .get()
          .then((value) => value.docs.map((e) => e.data()));
      return userData.toList();
    } catch (e, _) {
      _logger.e(e);
    }
  }
}
