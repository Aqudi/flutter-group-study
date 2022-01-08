import 'package:flutter/material.dart';
import 'package:newtalk/pages/friend/friend_page.dart';

class ChattingListPage extends StatelessWidget {
  const ChattingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FriendPage(),
                  ),
                );
              },
              child: const Text('친구'),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text('더보기'),
          ),
        ],
      ),
    );
  }
}
