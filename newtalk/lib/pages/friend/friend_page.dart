import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/pages/friend/widgets/profile_list_tile.dart';
import 'package:newtalk/services/auth_service.dart';

class FriendPage extends HookConsumerWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    // // 기존: dispose를 해주어야 하므로 StatefulWidget 사용
    // // hook 사용: dispose X, StatelessWidget 사용 가능
    final scrollController = useScrollController();

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(height: 10),
          ProfileListTile(user: authService.user),
          const Divider(),
          // // ListView.builder: 큰 사이즈의 데이터 처리에 적합

          FutureBuilder(
              future: authService.getFriends(),
              builder: (context, AsyncSnapshot<List<AppUser>?> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('다시 시도해주세요.'),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final users = snapshot.data!;
                  return ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) => ProfileListTile(
                      user: users[index],
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
