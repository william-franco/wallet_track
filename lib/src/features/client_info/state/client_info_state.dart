// Project imports:
import 'package:wallet_track/src/features/client_info/models/client_info_model.dart';

sealed class ClientInfoState {}

final class ClientInfoInitial extends ClientInfoState {}

final class ClientInfoLoading extends ClientInfoState {}

final class ClientInfoSuccess extends ClientInfoState {
  final ClientInfoModel clientInfo;

  ClientInfoSuccess({required this.clientInfo});
}

final class ClientInfoFailure extends ClientInfoState {
  final String message;

  ClientInfoFailure({required this.message});
}
