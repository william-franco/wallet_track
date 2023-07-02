import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_list_view_model.dart';
import 'package:wallet_track/src/services/http_service.dart';

void main() {
  group('PurchaseListViewModel', () {
    late HttpService httpService;
    late PurchaseRepository purchaseRepository;
    late PurchaseListViewModel purchaseListViewModel;

    setUp(() {
      httpService = HttpServiceImpl();
      purchaseRepository = PurchaseRepositoryImpl(httpService: httpService);
      purchaseListViewModel =
          PurchaseListViewModelImpl(purchaseRepository: purchaseRepository);
    });

    test('Value should be initial state', () {
      expect(purchaseListViewModel.value, isA<PurchaseInitial>());
    });

    test('Value should be success state', () async {
      await purchaseListViewModel.readPurchases();
      expect(purchaseListViewModel.value, isA<PurchaseSuccess>());
    });
  });
}
