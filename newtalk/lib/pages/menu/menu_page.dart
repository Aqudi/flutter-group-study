import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/services/auth_service.dart';

class MenuPage extends HookConsumerWidget {
  const MenuPage({Key? key}) : super(key: key);

  Widget _buildMenuButton(String title, Future<void> Function() onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    return authService.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              _buildMenuButton(
                '로그아웃',
                () async {
                  await authService.logout();
                },
              )
            ],
          );
  }
}
