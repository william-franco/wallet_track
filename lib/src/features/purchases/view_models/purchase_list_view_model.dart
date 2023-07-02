// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';

abstract base class PurchaseListViewModel extends ValueNotifier<PurchaseState> {
  PurchaseListViewModel() : super(PurchaseInitial());

  Future<void> readPurchases();
}

base class PurchaseListViewModelImpl extends ValueNotifier<PurchaseState>
    implements PurchaseListViewModel {
  final PurchaseRepository purchaseRepository;

  PurchaseListViewModelImpl({
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
    log('Purchase List state: $value');
  }
}
