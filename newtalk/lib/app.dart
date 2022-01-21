import 'package:flutter/material.dart';
import 'package:newtalk/pages/auth/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: Typography.material2018().black,
      ),
      home: const LoginPage(),
    );
  }
}
