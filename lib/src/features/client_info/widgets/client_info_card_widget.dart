import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_track/src/common_widgets/common_wallet_card.dart';
import 'package:wallet_track/src/features/client_info/state/client_info_state.dart';
import 'package:wallet_track/src/features/client_info/view_models/client_info_view_model.dart';

class ClientInfoCardWidget extends StatefulWidget {
  const ClientInfoCardWidget({super.key});

  @override
  State<ClientInfoCardWidget> createState() => _ClientInfoCardWidgetState();
}

class _ClientInfoCardWidgetState extends State<ClientInfoCardWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<ClientInfoViewModel>().readClientInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientInfoViewModel>(
      builder: (context, state, child) {
        return switch (state.value) {
          ClientInfoInitial() => const Text('Sem cartão.'),
          ClientInfoLoading() => const CircularProgressIndicator(),
          ClientInfoSuccess(clientInfo: final clientInfo) => CommonWalletCard(
              cardClientName: clientInfo.name!,
              cardNumber: clientInfo.cardNumber!,
            ),
          ClientInfoFailure(message: final message) => Text(message),
        };
      },
    );
  }
}
