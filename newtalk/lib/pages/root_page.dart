import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/pages/root_tabs/root_tab_page.dart';
import 'package:newtalk/top_level_providers.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(firebaseAuthProvider);
    final logger = ref.read(loggerProvider);
    final authStateChanges = ref.watch(authStateChangesProvider);

    // 로그인 여부에 따라서 RootTabPage 또는 SignInScreen으로 이동
    return authStateChanges.map(
      data: (data) {
        logger.d(data.toString());
        if (data.value != null) {
          return const RootTabPage();
        } else {
          return SignInScreen(
            auth: auth,
            showAuthActionSwitch: false,
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to FlutterFire UI! Please sign in to continue.'
                      : 'Welcome to FlutterFire UI! Please create an account to continue',
                ),
              );
            },
            footerBuilder: (context, _) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            headerBuilder: (context, constraints, _) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      'https://firebase.flutter.dev/img/flutterfire_300x.png'),
                ),
              );
            },
            providerConfigs: const [
              GoogleProviderConfiguration(
                clientId:
                    "870425226349-gcjd13va22et2gkjj1c746ejin7nr8id.apps.googleusercontent.com",
              ),
            ],
          );
        }
      },
      error: (error) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: (loading) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
