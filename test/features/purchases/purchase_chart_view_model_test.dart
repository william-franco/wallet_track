import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_chart_view_model.dart';
import 'package:wallet_track/src/services/http_service.dart';

void main() {
  group('PurchaseChartViewModel', () {
    late HttpService httpService;
    late PurchaseRepository purchaseRepository;
    late PurchaseChartViewModel purchaseChartViewModel;

    setUp(() {
      httpService = HttpServiceImpl();
      purchaseRepository = PurchaseRepositoryImpl(httpService: httpService);
      purchaseChartViewModel =
          PurchaseChartViewModelImpl(purchaseRepository: purchaseRepository);
    });

    test('Value should be initial state', () {
      expect(purchaseChartViewModel.value, isA<PurchaseInitial>());
    });

    test('Value should be success state', () async {
      await purchaseChartViewModel.readPurchases();
      expect(purchaseChartViewModel.value, isA<PurchaseSuccess>());
    });
  });
}
