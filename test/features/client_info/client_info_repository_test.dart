import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/client_info/models/client_info_model.dart';
import 'package:wallet_track/src/features/client_info/repositories/client_info_repository.dart';
import 'package:wallet_track/src/services/http_service.dart';

void main() {
  group('ClientInfoRepository', () {
    late HttpService httpService;
    late ClientInfoRepository clientInfoRepository;

    setUp(() {
      httpService = HttpServiceImpl();
      clientInfoRepository = ClientInfoRepositoryImpl(httpService: httpService);
    });

    test('Value expected should be an item of type ClientInfoModel', () async {
      final clientInfo = await clientInfoRepository.readClientInfo();
      expect(clientInfo, isA<Success<ClientInfoModel, Exception>>());
    });
  });
}
