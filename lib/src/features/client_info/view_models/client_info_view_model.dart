import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet_track/src/exception_handling/exception_handling.dart';
import 'package:wallet_track/src/features/client_info/repositories/client_info_repository.dart';
import 'package:wallet_track/src/features/client_info/state/client_info_state.dart';

abstract base class ClientInfoViewModel extends ValueNotifier<ClientInfoState> {
  ClientInfoViewModel() : super(ClientInfoInitial());

  Future<void> readClientInfo();
}

base class ClientInfoViewModelImpl extends ValueNotifier<ClientInfoState>
    implements ClientInfoViewModel {
  final ClientInfoRepository clientInfoRepository;

  ClientInfoViewModelImpl({
    required this.clientInfoRepository,
  }) : super(ClientInfoInitial());

  @override
  Future<void> readClientInfo() async {
    value = ClientInfoLoading();
    final result = await clientInfoRepository.readClientInfo();
    final clientInfo = switch (result) {
      Success(value: final clientInfo) =>
        ClientInfoSuccess(clientInfo: clientInfo),
      Failure(exception: final exception) =>
        ClientInfoFailure(message: 'Something went wrong: $exception'),
    };
    value = clientInfo;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Client info state: $value');
  }
}
