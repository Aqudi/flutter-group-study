import 'package:flutter/material.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: "더보기",
      body: Center(child: Text('더보기')),
    );
  }
}
