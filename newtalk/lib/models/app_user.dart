import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.g.dart';
part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    String? displayName,
    String? email,
    String? photoURL,
  }) = _AppUser;

  factory AppUser.fromFirebaseAuthUser(User user) => AppUser(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
      );

  factory AppUser.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      AppUser.fromJson(doc.data()!);

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  const AppUser._();

  String get name => displayName ?? email ?? uid;
}
