import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/pages/root_tabs/root_tab_page.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final textEditingController = useTextEditingController();

    return BaseScaffold(
      title: 'Login',
      isLoading: authService.isLoading,
      body: Column(
        children: [
          const SizedBox(height: 150),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: "username",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await authService.login(textEditingController.text);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootTabPage(),
                ),
              );
            },
            child: const Text('로그인'),
          ),
        ],
      ),
    );
  }
}
