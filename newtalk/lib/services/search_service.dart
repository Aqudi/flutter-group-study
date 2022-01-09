import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchServiceProvider =
    StateNotifierProvider<SearchService, String>((ref) => SearchService());

class SearchService extends StateNotifier<String> {
  SearchService([String? keyword]) : super(keyword ?? '');

  void search(String? keyword) => state = keyword ?? '';
  void clear(String keyword) => state = '';
}
