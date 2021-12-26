import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtalk/pages/friend/friend_page.dart';
import 'package:newtalk/pages/menu/menu_page.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class ChattingPage extends StatelessWidget {
  /// 버튼 종류는 2가지
  /// - TextButton
  /// - ElevatedButton
  ///
  /// Routing
  /// - Navigator.push, pop, pushReplacement 등이 있다.
  /// - push가 들어간 함수 같은 경우에는 pageRoute라는 것을 사용함
  /// - page Route에는 여러 종류가 있음
  ///   - MaterialPageRoute
  ///   - CupertinoPageRoute
  ///
  /// Material의 기본
  /// - Scaffold
  ///   - AppBar, Drawer, body
  ///
  /// Widget 들
  /// - SizedBox
  /// - Container
  /// - Column, Row
  /// - Text
  const ChattingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "채팅",
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "채팅",
              style: TextStyle(
                color: Colors.orange,
                backgroundColor: Colors.pink,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 50,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // 페이지 이동하는 방법 - Cupertino IOS가 하는 스타일로
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const FriendPage(),
                    ),
                  );
                },
                child: const Text('친구'),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  // 페이지 이동하는 방법 - Material Android가 하는 스타일로
                  MaterialPageRoute(
                    builder: (context) => const MenuPage(),
                  ),
                );
              },
              child: const Text('더보기'),
            ),
          ],
        ),
      ),
    );
  }
}
