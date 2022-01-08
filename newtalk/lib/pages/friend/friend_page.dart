import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newtalk/pages/friend/widgets/profile_list_tile.dart';
import 'package:newtalk/services/search_service.dart';

class FriendPage extends ConsumerStatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends ConsumerState<FriendPage> {
  final scrollController = ScrollController();
  bool switchValue = false;

  final friends = List.generate(100, (index) => '친구 #$index');

  @override
  Widget build(BuildContext context) {
    final searchService = ref.watch(searchServiceProvider);

    final filtered = friends.where((value) {
      return value.contains(searchService.key?.key ?? '');
    });

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const ProfileListTile(name: "나"),
          const Divider(),
          ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: filtered.map((e) => ProfileListTile(name: e)).toList(),
          ),
        ],
      ),
    );
  }
}
