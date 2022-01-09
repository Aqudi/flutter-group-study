import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/services/base_service.dart';

final authServiceProvider = ChangeNotifierProvider((ref) => AuthService());

class AuthService extends BaseService {
  String? name;

  Future<void> login(String newName) async {
    toLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    name = newName;
    toReady();
  }

  Future<void> logout() async {
    toLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    name = null;
    toReady();
  }
}
