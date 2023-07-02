import 'package:wallet_track/src/environments/environments.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/purchases/models/purchase_model.dart';
import 'package:wallet_track/src/services/http_service.dart';

abstract interface class PurchaseRepository {
  Future<Result<List<PurchaseModel>, Exception>> readPurchases();
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final HttpService httpService;

  PurchaseRepositoryImpl({
    required this.httpService,
  });

  @override
  Future<Result<List<PurchaseModel>, Exception>> readPurchases() async {
    try {
      final response = await httpService.getData(
        path: '${Environments.baseURL}${Environments.purchases}',
      );
      switch (response.statusCode) {
        case 200:
          final success = (response.data as List)
              .map((e) => PurchaseModel.fromJson(e))
              .toList();
          return Success(value: success);
        default:
          return Failure(exception: Exception(response.statusMessage));
      }
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
