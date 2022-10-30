import 'package:flutter/material.dart';

class BaseService extends ChangeNotifier {
  bool isLoading = false;

  /// Async 작업의 시작에는 [toLoading]을 끝에는 [toReady]를 호출해주는 helper
  Future<T> whileLoading<T>(Future<T> Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toReady);
  }

  /// loading 상태로 전환
  void toLoading() {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();
  }

  /// ready 상태로 전환
  void toReady() {
    if (!isLoading) return;

    isLoading = false;
    notifyListeners();
  }
}
