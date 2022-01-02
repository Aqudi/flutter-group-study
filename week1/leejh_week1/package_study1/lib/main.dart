import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlipCard',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = FlipCardController();
  bool _value = false;

  _renderBg() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
        // fill: Fill.fillFront,
        controller: _controller,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        flipOnTouch: false,
        // onFlipDone: (status) {
        //   print(status);
        // },
        front: Container(
          width: 300,
          height: 450,
          decoration: const BoxDecoration(
            color: Color(0x00000000),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                image: AssetImage('assets/card_back.png'), fit: BoxFit.fill),
          ),
        ),
        back: Container(
          width: 300,
          height: 450,
          decoration: const BoxDecoration(
            color: Color(0x00000000),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                image: AssetImage('assets/card_barus.png'), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipCard'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Switch(
                  value: _value,
                  onChanged: (value) {
                    _value = value;
                    if (_value) {
                      _controller.toggleCard();
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
