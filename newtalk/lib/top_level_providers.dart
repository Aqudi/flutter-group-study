import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/services/firestore_service.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final authStateChangesProvider = StreamProvider<AppUser?>(
    (ref) => ref.read(authServiceProvider).authStateChanges);

final loggerProvider = Provider<Logger>((ref) {
  Level level = Level.debug;
  if (kReleaseMode) {
    level = Level.error;
  }
  return Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 8,
    ),
    level: level,
  );
});
