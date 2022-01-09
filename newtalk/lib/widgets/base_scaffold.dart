import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final bool isLoading;
  final String? title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const BaseScaffold({
    Key? key,
    this.isLoading = false,
    this.title,
    this.actions = const [],
    this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title ?? 'Unknown'),
          actions: actions,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
