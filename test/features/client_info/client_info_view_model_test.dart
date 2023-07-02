import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/features/client_info/repositories/client_info_repository.dart';
import 'package:wallet_track/src/features/client_info/state/client_info_state.dart';
import 'package:wallet_track/src/features/client_info/view_models/client_info_view_model.dart';
import 'package:wallet_track/src/services/http_service.dart';

void main() {
  group('ClientInfoViewModel', () {
    late HttpService httpService;
    late ClientInfoRepository clientInfoRepository;
    late ClientInfoViewModel clientInfoViewModel;

    setUp(() {
      httpService = HttpServiceImpl();
      clientInfoRepository = ClientInfoRepositoryImpl(httpService: httpService);
      clientInfoViewModel =
          ClientInfoViewModelImpl(clientInfoRepository: clientInfoRepository);
    });

    test('Value should be initial state', () {
      expect(clientInfoViewModel.value, isA<ClientInfoInitial>());
    });

    test('Value should be success state', () async {
      await clientInfoViewModel.readClientInfo();
      expect(clientInfoViewModel.value, isA<ClientInfoSuccess>());
    });
  });
}
