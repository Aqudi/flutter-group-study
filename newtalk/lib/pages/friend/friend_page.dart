import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/pages/friend/widgets/profile_list_tile.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/services/search_service.dart';

class FriendPage extends HookConsumerWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(authServiceProvider).name;
    final searchKeyword = ref.watch(searchServiceProvider);

    // // 기존: dispose를 해주어야 하므로 StatefulWidget 사용
    // // hook 사용: dispose X, StatelessWidget 사용 가능
    final scrollController = useScrollController();

    // 값을 기억
    final friends = useMemoized(() => ["철수", "영희", "태조", "세종"]);

    // // state로 useState로 사용 가능 (이때는 ValueNotifier로 적용됨)
    // // state value는 applyFilter.value로 바꾸거나 사용 가능
    final useFilter = useState(true);

    final filtered = friends.where((value) {
      if (useFilter.value) {
        return value.contains(searchKeyword);
      }
      return true;
    });

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Switch(
            value: useFilter.value,
            onChanged: (value) {
              useFilter.value = value;
            },
          ),
          const SizedBox(height: 10),
          ProfileListTile(name: '$username'),
          const Divider(),
          // ListView.builder: 큰 사이즈의 데이터 처리에 적합
          ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: filtered.length,
            itemBuilder: (context, index) => ProfileListTile(
              name: filtered.elementAt(index),
            ),
          ),
        ],
      ),
    );
  }
}
