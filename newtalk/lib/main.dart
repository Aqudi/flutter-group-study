import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/app.dart';

Future<void> main() async {
  // await을 사용하기 위한 설정
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase 초기화
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: App()));
}
