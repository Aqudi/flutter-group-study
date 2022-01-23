import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/pages/chatting/chatting_list_page.dart';
import 'package:newtalk/pages/friend/friend_page.dart';
import 'package:newtalk/pages/menu/menu_page.dart';
import 'package:newtalk/services/search_service.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class RootTabPage extends ConsumerStatefulWidget {
  const RootTabPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RootTabPage> createState() => _RootTabPageState();
}

class _RootTabPageState extends ConsumerState<RootTabPage> {
  final pages = [
    const FriendPage(),
    const ChattingListPage(),
    const MenuPage(),
  ];

  int tabIndex = 0;

  final textEditionController = TextEditingController();

  Future<String?> showSampleDialog(
    BuildContext context, {
    Color? backgroundColor,
  }) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text('검색'),
          content: TextField(
            controller: textEditionController,
            decoration: const InputDecoration(hintText: '텍스트'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Cancle 누르면 비우기
                textEditionController.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancle'),
            ),
            TextButton(
              onPressed: () {
                // OK 누르면 텍스트 값 저장하고 비우기
                final text = textEditionController.text;
                textEditionController.clear();
                Navigator.pop<String>(context, text);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // controller 사용 후 dispose로 메모리 반환
    textEditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchService = ref.read(searchServiceProvider.notifier);

    return BaseScaffold(
      title: "채팅앱",
      actions: [
        IconButton(
          onPressed: () async {
            final value = await showSampleDialog(
              context,
              backgroundColor: Colors.amber[50],
            );
            searchService.search(value);
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            showSampleDialog(
              context,
              backgroundColor: Colors.amber[50],
            ).then((value) => value);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '친구',
            tooltip: '친구',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: '채팅',
            tooltip: '채팅',
            icon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            label: '더보기',
            tooltip: '더보기',
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return pages.elementAt(tabIndex);
  }
}
