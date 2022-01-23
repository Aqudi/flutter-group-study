import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/services/base_service.dart';
import 'package:newtalk/services/firestore_service.dart';
import 'package:newtalk/top_level_providers.dart';

final authServiceProvider = ChangeNotifierProvider((ref) {
  final _auth = ref.watch(firebaseAuthProvider);
  final _fireStoreService = ref.read(fireStoreServiceProvider);
  final _logger = ref.read(loggerProvider);
  return AuthService(
    _auth,
    _fireStoreService,
    _logger,
  );
});

class AuthService extends BaseService {
  final FirebaseAuth _auth;
  final FireStoreService _fireStoreService;
  final Logger _logger;
  final _googleSignIn = GoogleSignIn();

  AuthService(this._auth, this._fireStoreService, this._logger);

  Future<AppUser?> _getUserByUid(User? user) async {
    if (user?.uid != null) {
      AppUser? userWithProfile = await _fireStoreService.getUser(user!.uid);
      if (userWithProfile == null) {
        await _fireStoreService.createUser(user);
        userWithProfile = await _fireStoreService.getUser(user.uid);
      }
      return userWithProfile;
    } else {
      _logger.e("uid가 null입니다.");
    }
  }

  // FirebaseAuth의 User를 AppUser로 변환
  Stream<AppUser?> get authStateChanges =>
      _auth.authStateChanges().asyncMap((user) async {
        _user = await _getUserByUid(user);
        return _user;
      });

  AppUser? _user;
  AppUser get user => _user!;

  Future<List<AppUser>?> getFriends() async {
    return _fireStoreService.getFriends(user);
  }

  /// FirebaseAuth의 User 로그아웃
  Future<void> logout() async {
    return whileLoading(() async {
      // 다시 로그인할 때 계정 선택창이 뜨도록 하기 위해서 필요함
      await _googleSignIn.signOut();
      // Freibase 로그아웃
      await _auth.signOut();
    });
  }
}
