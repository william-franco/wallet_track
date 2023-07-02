// Project imports:
import 'package:wallet_track/src/features/purchases/models/purchase_model.dart';

sealed class PurchaseState {}

final class PurchaseInitial extends PurchaseState {}

final class PurchaseLoading extends PurchaseState {}

final class PurchaseSuccess extends PurchaseState {
  final List<PurchaseModel> purchases;

  PurchaseSuccess({required this.purchases});
}

final class PurchaseFailure extends PurchaseState {
  final String message;

  PurchaseFailure({required this.message});
}
