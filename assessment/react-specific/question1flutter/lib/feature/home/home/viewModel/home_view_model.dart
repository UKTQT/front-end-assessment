import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/base/viewModel/base_view_model.dart';
import '../service/home_service.dart';
import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  final HomeService _homeService = HomeService();

  HomeViewModel() {
    fetchItems();
  }

  List? homeItems = [];
  bool? previousBtnStatus;

  Future<List<dynamic>?> fetchItems() async {
    homeItems = await _homeService.fetchItems();
    notifyListeners();
  }

  Future<List<dynamic>?> fetchNextItems() async {
    previousBtnStatus = true;
    homeItems = await _homeService.fetchNextItems();
    notifyListeners();
  }

  Future<dynamic> fetchPreviousItems() async {
    homeItems = await _homeService.fetchPreviousItems();
    notifyListeners();
  }
}
