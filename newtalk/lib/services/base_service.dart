import 'package:flutter/material.dart';

class BaseService extends ChangeNotifier {
  bool isLoading = false;

  void toLoading() {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();
  }

  void toReady() {
    if (!isLoading) return;

    isLoading = false;
    notifyListeners();
  }
}
