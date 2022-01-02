import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String? title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const BaseScaffold({
    Key? key,
    this.title,
    this.actions = const [],
    this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Unknown'),
        actions: actions,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
