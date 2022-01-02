import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newtalk/services/search_service.dart';

class FriendPage extends ConsumerStatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends ConsumerState<FriendPage> {
  bool switchValue = false;

  final friends = List.generate(100, (index) => '친구 #$index');

  Widget _buildProfile(String name) {
    const size = 20.0;

    return ListTile(
      contentPadding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15,
      ),
      horizontalTitleGap: 20,
      leading: const SizedBox(
        height: double.infinity,
        child: CircleAvatar(
          child: Icon(Icons.person, size: size),
          radius: size,
        ),
      ),
      onTap: () {},
      title: Text(
        name,
        style: const TextStyle(
          fontSize: size,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchService = ref.watch(searchServiceProvider);

    final filtered = friends.where((value) {
      return value.contains(searchService.key?.key ?? '');
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildProfile("나"),
          const Divider(),
          ListView(
            shrinkWrap: true,
            children: filtered.map((e) => _buildProfile(e)).toList(),
          ),
        ],
      ),
    );
  }
}
