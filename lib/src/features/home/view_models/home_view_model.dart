// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

abstract base class HomeViewModel extends ValueNotifier<int> {
  HomeViewModel() : super(0);

  void updateIndex({required int index});
}

base class HomeViewModelImpl extends ValueNotifier<int>
    implements HomeViewModel {
  HomeViewModelImpl() : super(0);

  @override
  void updateIndex({required int index}) {
    value = index;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Tab: $value');
  }
}
