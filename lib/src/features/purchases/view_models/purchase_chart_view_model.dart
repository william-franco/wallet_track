import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';

abstract base class PurchaseChartViewModel
    extends ValueNotifier<PurchaseState> {
  PurchaseChartViewModel() : super(PurchaseInitial());

  Future<void> readPurchases();
}

base class PurchaseChartViewModelImpl extends ValueNotifier<PurchaseState>
    implements PurchaseChartViewModel {
  final PurchaseRepository purchaseRepository;

  PurchaseChartViewModelImpl({
    required this.purchaseRepository,
  }) : super(PurchaseInitial());

  @override
  Future<void> readPurchases() async {
    value = PurchaseLoading();
    final result = await purchaseRepository.readPurchases();
    final purchases = switch (result) {
      Success(value: final purchases) => PurchaseSuccess(purchases: purchases),
      Failure(exception: final exception) =>
        PurchaseFailure(message: 'Something went wrong: $exception'),
    };
    value = purchases;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Purchase chart state: $value');
  }
}
