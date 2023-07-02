import 'package:wallet_track/src/environments/environments.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/client_info/models/client_info_model.dart';
import 'package:wallet_track/src/services/http_service.dart';

abstract interface class ClientInfoRepository {
  Future<Result<ClientInfoModel, Exception>> readClientInfo();
}

class ClientInfoRepositoryImpl implements ClientInfoRepository {
  final HttpService httpService;

  ClientInfoRepositoryImpl({
    required this.httpService,
  });

  @override
  Future<Result<ClientInfoModel, Exception>> readClientInfo() async {
    try {
      final response = await httpService.getData(
        path: '${Environments.baseURL}${Environments.clientInfo}',
      );
      switch (response.statusCode) {
        case 200:
          final success = ClientInfoModel.fromJson(response.data[0]);
          return Success(value: success);
        default:
          return Failure(exception: Exception(response.statusMessage));
      }
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
