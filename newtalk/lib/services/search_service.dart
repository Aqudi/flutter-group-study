import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newtalk/services/base_service.dart';

final searchServiceProvider = ChangeNotifierProvider((ref) => SearchService());

@immutable
class SearchKey {
  final String? key;

  const SearchKey(this.key);
}

class SearchService extends BaseService {
  SearchKey? _key;

  SearchKey? get key => _key;
  set key(SearchKey? key) {
    _key = key;
    notifyListeners();
  }
}
