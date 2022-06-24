import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_codegen/mobx_codegen.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  final HomeService _homeService = HomeService();

  @override
  void init({int? id}) {
    //fetchCharacterItems();
  }

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  /* @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  } */

  /*  @action
  Future<List<CharacterResult>?> fetchCharacterItems() async {
    characterItemsIsLoading = true;
    characterItems = await _homeService.fetchCharacterItems() ?? [];
    characterItemsIsLoading = false;
  } */
}
