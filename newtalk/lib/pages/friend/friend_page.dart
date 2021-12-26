import 'package:flutter/material.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class FriendPage extends StatefulWidget {
  /// 친구 페이지
  ///
  /// - 스크롤 하는 법
  /// - Expanded를 Row, Column에서 사용하는 법
  /// - StatefulWidget 사용하는 법을 공부함
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "친구",
      // 스크롤을 할 수 있게 됨
      body: SingleChildScrollView(
        child: Column(
          children: [
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                print(switchValue);
                setState(() {});
              },
            ),
            // 3항 연산자
            switchValue ? _build4ColorContainers() : _build4ColorContainers2(),

            // 조건부 리스트 아이템
            if (!switchValue) _build4ColorContainers(),
            if (switchValue) _build4ColorContainers2(),

            // 함수를 바로 작동 (IIFE)
            (() {
              // 1. late Widget 쓰기
              // 2. Widget widget = 바로 초기화하기
              // 3. if else 쓰기
              late Widget widget;
              if (switchValue) {
                widget = _build4ColorContainers();
              }
              if (!switchValue) {
                widget = _build4ColorContainers2();
              }
              return widget;
            })(),
          ],
        ),
      ),
    );
  }

  Widget _build4ColorContainers() {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.orange,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _build4ColorContainers2() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 500,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 500,
            color: Colors.orange,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 500,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
