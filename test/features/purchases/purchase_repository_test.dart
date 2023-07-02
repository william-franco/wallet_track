import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/purchases/models/purchase_model.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/services/http_service.dart';

void main() {
  group('PurchaseRepository', () {
    late HttpService httpService;
    late PurchaseRepository purchaseRepository;

    setUp(() {
      httpService = HttpServiceImpl();
      purchaseRepository = PurchaseRepositoryImpl(httpService: httpService);
    });

    test('Value expected should be an item of type List<PurchaseModel>',
        () async {
      final purchases = await purchaseRepository.readPurchases();
      expect(purchases, isA<Success<List<PurchaseModel>, Exception>>());
    });
  });
}
